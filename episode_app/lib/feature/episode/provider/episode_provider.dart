import 'package:episode_app/feature/episode/provider/i_episode_provider.dart';
import 'package:episode_app/feature/episode/provider/model/episode_api_result.dart';

final class EpisodeProvider extends IEpisodeProvider {
  @override
  Future<EpisodeApiResult> fetchEpisodes() {
    throw UnimplementedError();
  }

  @override
  Future<PeopleApiResult> fetchPeople() {
    throw UnimplementedError();
  }
}
