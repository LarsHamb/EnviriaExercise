part of 'episode_bloc.dart';

@immutable
sealed class EpisodeCollectionState {
  final List<Episode> episodeList;
  final List<Person> peopleList;
  final SortOrder sortOrder;
  const EpisodeCollectionState(
      this.episodeList, this.peopleList, this.sortOrder);
}

final class EpisodeCollectionEmpty extends EpisodeCollectionState {
  const EpisodeCollectionEmpty(
      super.episodeList, super.peopleList, super.sortOrder);
}

final class EpisodeCollectionLoading extends EpisodeCollectionState {
  const EpisodeCollectionLoading(
      super.episodeList, super.peopleList, super.sortOrder);
}

final class EpisodeCollectionLoaded extends EpisodeCollectionState {
  const EpisodeCollectionLoaded(
      super.episodeList, super.peopleList, super.sortOrder);
}

enum SortOrder { asc, dsc }
