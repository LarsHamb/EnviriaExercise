part of 'episode_bloc.dart';

@immutable
sealed class EpisodeCollectionEvent {}

class EpisodeCollectionFetchEvent extends EpisodeCollectionEvent {}

class EpisodeReorderEvent extends EpisodeCollectionEvent {
  EpisodeReorderEvent(this.newSortOrder);
  final SortOrder newSortOrder;
}
