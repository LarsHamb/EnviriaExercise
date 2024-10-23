import 'dart:async';

import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/episode/provider/i_episode_provider.dart';
import 'package:episode_app/feature/episode/provider/model/episode_api_result.dart';
import 'package:episode_app/feature/error/model/error.dart';
import 'package:episode_app/feature/people/model/people.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// A repository class responsible for handling operations related to episodes.
///
/// This class provides methods to fetch and sort episode data.
/// It acts as an intermediary between the data source and the application,
/// ensuring that the data is retrieved and stored in a consistent manner.
class EpisodeRepository {
  final IEpisodeProvider _provider;

  EpisodeRepository(this._provider);

  //ToDo: implement caching
  EpisodeCollection? _episodeCollection;
  //PeopleCollection? _peopleCollection;

  //Error Stream
  final _errorController = StreamController<Error>();
  Stream<Error> get stream => _errorController.stream;
  void addErrorToStream(Error error) => _errorController.sink.add(error);

  Future<EpisodeCollection> fetchEpisodes() async {
    var result = await _provider.fetchEpisodes();

    if (!handleApiResult(result) ||
        result.episodeCollection == null ||
        result.episodeCollection!.episodes.isEmpty) {
      addErrorToStream(Error('Failed to fetch episodes', StatusCode.unknown));
      throw Exception('Failed to fetch episodes');
    }

    _episodeCollection = result.episodeCollection;

    filterDuplicates(result.episodeCollection!);

    for (var e in result.episodeCollection!.episodes.values) {
      e.setImage(await fetchImage(e.imageUrl));
    }

    return result.episodeCollection!;
  }

  Future<PeopleCollection> fetchPeople() async {
    var result = await _provider.fetchPeople();

    if (!handleApiResult(result) ||
        result.peopleCollection == null ||
        result.peopleCollection!.people.isEmpty) {
      addErrorToStream(Error('Failed to fetch people', StatusCode.unknown));
      throw Exception('Failed to fetch people');
    }

    return result.peopleCollection!;
  }

  bool handleApiResult(ApiResult result) {
    switch (result.statusCode) {
      case StatusCode.ok:
        return true;
      case StatusCode.noContent:
        addErrorToStream(Error(result.statusMessage, result.statusCode));
        return false;
      //...
      default:
        addErrorToStream(Error("Unbekannter Fehler", StatusCode.unknown));
        return false;
    }
  }

  void filterDuplicates(EpisodeCollection episodeCollection) {
    if (_episodeCollection == null) {
      _episodeCollection = episodeCollection;
      return;
    }

    episodeCollection.episodes.removeWhere(
        (key, value) => value.episodeTitle.contains('(Duplicate)'));

    _episodeCollection!.episodes.addAll(episodeCollection.episodes);
  }

  Future<Uint8List> fetchImage(String url) async {
    try {
      if (!kDebugMode) {
        return (await NetworkAssetBundle(Uri.parse(url)).load(url))
            .buffer
            .asUint8List();
      } else {
        return Uint8List.fromList([]);
      }
    } catch (e) {
      debugPrint('FakeEpisodeProvider.fetchImage Error: $e');
      //addErrorToStream(Error('Failed to fetch image', StatusCode.unknown));
      return Uint8List.fromList([]);
    }
  }
}
