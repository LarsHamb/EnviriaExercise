import 'package:episode_app/feature/episode/provider/model/episode_api_result.dart';

abstract base class IEpisodeProvider {
  /// Fetches a list of episodes from the API.
  ///
  /// This method performs an asynchronous operation to retrieve episode data.
  /// It returns an [EpisodeApiResult] which contains the fetched episodes.
  ///
  /// Returns:
  ///   A [Future] that completes with an [EpisodeApiResult] containing the episodes.
  ///
  /// Throws:
  ///   An [Exception] if the fetch operation fails.
  Future<EpisodeApiResult> fetchEpisodes();

  /// Fetches a list of people from the API.
  ///
  /// This method makes a network request to retrieve data about people.
  /// It returns a [PeopleApiResult] which contains the list of people
  /// and any additional metadata.
  ///
  /// Throws an [Exception] if the network request fails or if the data
  /// cannot be parsed.
  Future<PeopleApiResult> fetchPeople();
}
