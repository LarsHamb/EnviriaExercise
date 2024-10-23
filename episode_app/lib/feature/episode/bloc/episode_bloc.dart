import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/episode/repository/episode_repository.dart';
import 'package:episode_app/feature/people/model/people.dart';
import 'package:flutter/widgets.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeCollectionBloc
    extends Bloc<EpisodeCollectionEvent, EpisodeCollectionState> {
  EpisodeCollectionBloc(this._episodeRepository)
      : super(const EpisodeCollectionEmpty([], [], SortOrder.asc)) {
    on<EpisodeCollectionFetchEvent>(_onFetchEpisodes);
    on<EpisodeReorderEvent>(_onReorderEpisodes);
  }

  final EpisodeRepository _episodeRepository;

  _onFetchEpisodes(EpisodeCollectionFetchEvent event,
      Emitter<EpisodeCollectionState> emit) async {
    emit(EpisodeCollectionLoading(
        state.episodeList, state.peopleList, state.sortOrder));
    try {
      var episodeCollection = await _episodeRepository.fetchEpisodes();
      var peopleCollection = await _episodeRepository.fetchPeople();

      if (episodeCollection.episodes.isEmpty) {
        emit(EpisodeCollectionEmpty(
            state.episodeList, state.peopleList, state.sortOrder));
        return;
      }

      List<Episode> episodes = episodeCollection.episodes.values.toList();

      episodes.sort((a, b) =>
          (a.startTime.compareTo(b.startTime)) *
          (state.sortOrder == SortOrder.asc ? 1 : -1));

      emit(EpisodeCollectionLoaded(
          episodes, peopleCollection.people.values.toList(), state.sortOrder));
    } catch (e) {
      emit(EpisodeCollectionEmpty(
          state.episodeList, state.peopleList, state.sortOrder));
    }
  }

  FutureOr<void> _onReorderEpisodes(
      EpisodeReorderEvent event, Emitter<EpisodeCollectionState> emit) async {
    emit(EpisodeCollectionLoading(
        state.episodeList, state.peopleList, event.newSortOrder));

    await Future.delayed(const Duration(milliseconds: 400));

    var episodes = state.episodeList;

    episodes.sort((a, b) =>
        (a.startTime.compareTo(b.startTime)) *
        (event.newSortOrder == SortOrder.asc ? 1 : -1));

    emit(EpisodeCollectionLoaded(
        episodes, state.peopleList, event.newSortOrder));
  }
}
