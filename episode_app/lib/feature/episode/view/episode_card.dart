import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A widget that displays an episode card.
///
/// This widget is used to represent an episode with relevant details
/// such as title, show, and other metadata.
class EpisodeCardWidget extends StatelessWidget {
  const EpisodeCardWidget(this.episode, {super.key});
  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: Theme.of(context).colorScheme.primary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildCardHeader(context),
            buildImage(context),
            buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildFooterElement(
              context,
              'Date',
              //ToDo - use DateFormat
              '${episode.startTime.day.toString().padLeft(2, '0')}.${episode.startTime.month.toString().padLeft(2, '0')}.${episode.startTime.year.toString().substring(2)}',
              Icons.calendar_today),
          buildVerticalDivider(context),
          //const Spacer(),
          buildFooterElement(
              context,
              'Start',
              '${episode.startTime.hour.toString().padLeft(2, '0')}:${episode.startTime.minute.toString().padLeft(2, '0')}',
              Icons.alarm),
          buildVerticalDivider(context),

          buildFooterElement(
              context,
              'End',
              '${episode.endTime.hour.toString().padLeft(2, '0')}:${episode.endTime.minute.toString().padLeft(2, '0')}',
              Icons.alarm),
          // const Spacer(),
          buildVerticalDivider(context),

          buildFooterElement(context, 'Min', episode.durationMinutes.toString(),
              Icons.schedule),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        elevation: 2,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Stack(children: [
            episode.image.isNotEmpty
                ? Image.memory(episode.image)
                : Stack(alignment: Alignment.center, children: [
                    Image.asset('assets/images/TheLastOfUs.png')
                        .blurred(blur: 7),
                    Skeleton.ignore(
                      child: Center(
                        child: Icon(
                          Icons.photo_camera,
                          size: 70,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    )
                  ]),
            // Positioned(
            //     bottom: 8,
            //     left: 16,
            //     right: 16,
            //     child: ShaderMask(
            //       shaderCallback: (Rect bounds) {
            //         return const LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [Colors.black, Colors.transparent],
            //           stops: [0.5, 1.0],
            //         ).createShader(bounds);
            //       },
            //       blendMode: BlendMode.dstIn,
            //       child: Text(
            //         episode.description,
            //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //               color: Colors.black.withOpacity(0.65),
            //             ),
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ))
          ]),
        ),
      ),
    );
  }

  Widget buildCardHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          episode.showTitle,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .color!
                    .withOpacity(0.65),
              ),
        ),
        Text(
          episode.episodeTitle,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// This method is responsible for creating and returning a widget
  /// that represents a footer element in the episode card.
  Widget buildFooterElement(
      BuildContext context, String title, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        buidHorizontalDivider(context),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget buidHorizontalDivider(BuildContext context) {
    return Skeleton.ignore(
      child: SizedBox(
        width: 48,
        child: Divider(
          height: 4,
          thickness: 1,
          color:
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.65),
        ),
      ),
    );
  }

  Widget buildVerticalDivider(BuildContext context) {
    return Skeleton.ignore(
      child: SizedBox(
          height: 38,
          child: VerticalDivider(
            thickness: 1,
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.65),
          )),
    );
  }
}
