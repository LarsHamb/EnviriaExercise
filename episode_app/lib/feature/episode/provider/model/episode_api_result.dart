import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/people/model/people.dart';

enum StatusCode {
  unknown,
  ok,
  created,
  accepted,
  forbidden,
  noContent,
  partialContent,
}

base class ApiResult {
  final StatusCode statusCode;
  final String statusMessage;

  ApiResult({
    required this.statusCode,
    required this.statusMessage,
  });
}

final class EpisodeApiResult extends ApiResult {
  final EpisodeCollection? episodeCollection;

  EpisodeApiResult({
    this.episodeCollection,
    required super.statusCode,
    required super.statusMessage,
  });
}

final class PeopleApiResult extends ApiResult {
  final PeopleCollection? peopleCollection;

  PeopleApiResult({
    this.peopleCollection,
    required super.statusCode,
    required super.statusMessage,
  });
}
