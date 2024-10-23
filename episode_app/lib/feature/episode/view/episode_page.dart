import 'package:episode_app/feature/episode/bloc/episode_bloc.dart';
import 'package:episode_app/feature/episode/view/episode_collection.dart';
import 'package:episode_app/feature/error/view/error_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget that represents the episode page.
///
/// This page displays a list of episodes and includes an AppBar with a sort button.
/// The sort button allows users to toggle the sort order of the episodes between
/// ascending and descending.
class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        title: Text(
          'Episodes',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                //color: Theme.of(context).colorScheme.onSecondary
              ),
        ),
        actions: [
          BlocBuilder<EpisodeCollectionBloc, EpisodeCollectionState>(
              builder: (context, state) {
            return IconButton(
              icon: Icon(
                (state.sortOrder == SortOrder.asc)
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                size: 36,
                //color: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                context.read<EpisodeCollectionBloc>().add(
                      EpisodeReorderEvent(
                        (state.sortOrder == SortOrder.asc)
                            ? SortOrder.dsc
                            : SortOrder.asc,
                      ),
                    );
              },
            );
          })
        ],
      ),
      body: const ErrorListener(child: EpisodeCollection()),
    );
  }
}
