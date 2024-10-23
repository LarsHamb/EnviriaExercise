import 'package:episode_app/feature/episode/provider/model/episode_api_result.dart';

class Error {
  final String message;
  final StatusCode code;

  Error(this.message, this.code);
}
