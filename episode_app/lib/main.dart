import 'package:episode_app/feature/episode/bloc/episode_bloc.dart';
//import 'package:episode_app/feature/episode/provider/episode_provider.dart';
import 'package:episode_app/feature/episode/provider/fake_episode_provider.dart';
import 'package:episode_app/feature/episode/repository/episode_repository.dart';
import 'package:episode_app/feature/episode/view/episode_page.dart';
import 'package:episode_app/feature/error/bloc/error_bloc.dart';
import 'package:episode_app/theme/theme.dart';
import 'package:episode_app/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EpisodeApp());
}

class EpisodeApp extends StatelessWidget {
  const EpisodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Theme
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);

    //Repository
    EpisodeRepository episodeRepository = EpisodeRepository(
        //kDebugMode ? FakeEpisodeProvider() : EpisodeProvider());
        FakeEpisodeProvider());

    return MultiBlocProvider(
      providers: [
        BlocProvider<EpisodeCollectionBloc>(
          create: (context) => EpisodeCollectionBloc(episodeRepository)
            ..add(EpisodeCollectionFetchEvent()),
        ),
        BlocProvider<ErrorBloc>(
            create: (context) => ErrorBloc(episodeRepository))
      ],
      child: MaterialApp(
        title: 'Episode App',
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: const EpisodePage(),
      ),
    );
  }
}
