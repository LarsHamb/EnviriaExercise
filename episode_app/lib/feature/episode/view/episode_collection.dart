import 'package:episode_app/feature/episode/bloc/episode_bloc.dart';
import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/episode/view/episode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A stateless widget that represents a collection of episodes.
///
/// This widget is responsible for displaying a list of episodes
/// and interacts with the `EpisodeBloc` to manage the state and
/// business logic related to episodes.
class EpisodeCollection extends StatelessWidget {
  const EpisodeCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeCollectionBloc, EpisodeCollectionState>(
      builder: (context, state) {
        if (state is EpisodeCollectionEmpty) {
          return const Center(
            child: Text('No Episodes loaded'),
          );
        } else if (state is EpisodeCollectionLoading) {
          return Skeletonizer(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return EpisodeCardWidget(Episode.dummy());
                }),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<EpisodeCollectionBloc>().add(
                    EpisodeCollectionFetchEvent(),
                  );
            },
            child: ListView.builder(
              itemCount: state.episodeList.length,
              itemBuilder: (context, index) {
                // Adjust index to account for loading indicator
                var loadingIndex = index;
                if (state is EpisodeCollectionLoading) {
                  loadingIndex -= 1;
                  if (index == 0) {
                    return const Center(child: LinearProgressIndicator());
                  }
                }
                final episode = state.episodeList[loadingIndex];
                return EpisodeCardWidget(episode);
              },
            ),
          );
        }
      },
    );
  }
}
