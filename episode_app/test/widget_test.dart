// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:episode_app/feature/episode/model/episode.dart';
import 'package:episode_app/feature/episode/view/episode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EpisodeCard displays episode information',
      (WidgetTester tester) async {
    // Define a sample episode
    final episode = Episode.dummy();

    // Build the EpisodeCard widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EpisodeCardWidget(episode),
        ),
      ),
    );

    // Verify that the EpisodeCard displays the correct information
    expect(find.text('showTitle'), findsOneWidget);
    expect(find.text('Episode 7: Episode Title'), findsOneWidget);
    expect(find.text('01.01.22'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('12:00'), findsAtLeast(2));
  });
}
