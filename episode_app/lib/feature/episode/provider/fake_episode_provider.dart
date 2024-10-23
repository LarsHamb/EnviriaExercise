import 'dart:convert';

import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/episode/provider/i_episode_provider.dart';
import 'package:episode_app/feature/episode/provider/model/episode_api_result.dart';
import 'package:episode_app/feature/people/model/people.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A fake implementation of [IEpisodeProvider] used for debugging purposes.
///
/// This provider is utilized in debug mode to simulate episode data without
/// requiring a connection to a real backend service.
final class FakeEpisodeProvider extends IEpisodeProvider {
  @override
  Future<EpisodeApiResult> fetchEpisodes() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/data.json');

      EpisodeCollection episodeList =
          EpisodeCollection.fromJson(json.decode(jsonString));

      if (episodeList.episodes.isEmpty) {
        return EpisodeApiResult(
          statusCode: StatusCode.noContent,
          statusMessage: 'EpisodeList is empty',
        );
      }

      return EpisodeApiResult(
        statusCode: StatusCode.ok,
        statusMessage: 'Success',
        episodeCollection: episodeList,
      );
    } catch (e) {
      debugPrint('FakeEpisodeProvider.fetchEpisodes Error: $e');
      return EpisodeApiResult(
        statusCode: StatusCode.unknown,
        statusMessage: 'Error: $e',
      );
    }
  }

  @override
  Future<PeopleApiResult> fetchPeople() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/data.json');

      await Future.delayed(const Duration(milliseconds: 800));

      PeopleCollection peopleList =
          PeopleCollection.fromJson(json.decode(jsonString));

      if (peopleList.people.isEmpty) {
        return PeopleApiResult(
          statusCode: StatusCode.noContent,
          statusMessage: 'PeopleList is empty',
        );
      }

      return PeopleApiResult(
        statusCode: StatusCode.ok,
        statusMessage: 'Success',
        peopleCollection: peopleList,
      );
    } catch (e) {
      debugPrint('FakeEpisodeProvider.fetchPeople Error: $e');
      return PeopleApiResult(
        statusCode: StatusCode.unknown,
        statusMessage: 'Error: $e',
      );
    }
  }
}
