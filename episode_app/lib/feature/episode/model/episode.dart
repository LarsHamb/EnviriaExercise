import 'package:flutter/services.dart';

/// A class representing an episode in the application.
///
/// This class contains properties and methods related to an episode,
/// such as its title, description, and other relevant details.
class Episode {
  final int id;
  final String showTitle;
  final String episodeTitle;
  final String description;
  final String imageUrl;
  late Uint8List image;
  final DateTime startTime;
  final DateTime endTime;
  final int durationMinutes;
  final int host;
  final List<int> guests;
  final String location;
  final List<String> tags;
  final double rating;

  Episode({
    required this.id,
    required this.showTitle,
    required this.episodeTitle,
    required this.description,
    required this.imageUrl,
    required this.startTime,
    required this.endTime,
    required this.durationMinutes,
    required this.host,
    required this.guests,
    required this.location,
    required this.tags,
    required this.rating,
    required this.image,
  });

  setImage(Uint8List image) {
    this.image = image;
  }

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      showTitle: json['showTitle'],
      episodeTitle: json['episodeTitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      durationMinutes: json['durationMinutes'],
      host: json['host'],
      guests: List<int>.from(json['guests']),
      location: json['location'],
      tags: List<String>.from(json['tags']),
      rating: json['rating'].toDouble(),
      image: Uint8List(0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'showTitle': showTitle,
      'episodeTitle': episodeTitle,
      'description': description,
      'imageUrl': imageUrl,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'durationMinutes': durationMinutes,
      'host': host,
      'guests': guests,
      'location': location,
      'tags': tags,
      'rating': rating,
    };
  }

  static Episode dummy() {
    return Episode(
        id: 0,
        showTitle: 'showTitle',
        episodeTitle: 'Episode 7: Episode Title',
        description: 'description',
        imageUrl: 'imageUrl',
        startTime: DateTime(2022, 1, 1, 12, 0),
        endTime: DateTime(2022, 1, 1, 12, 0),
        durationMinutes: 60,
        host: 1,
        guests: [0],
        location: 'location',
        tags: ['tags'],
        rating: 5.0,
        image: Uint8List(0));
  }

  /// This function is intended for use in tests only.
  ///
  /// Note: Do not use this function in production code.
  Episode copyWith({
    int? id,
    String? showTitle,
    String? episodeTitle,
    String? description,
    String? imageUrl,
    Uint8List? image,
    DateTime? startTime,
    DateTime? endTime,
    int? durationMinutes,
    int? host,
    List<int>? guests,
    String? location,
    List<String>? tags,
    double? rating,
  }) {
    return Episode(
      id: id ?? this.id,
      showTitle: showTitle ?? this.showTitle,
      episodeTitle: episodeTitle ?? this.episodeTitle,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      image: image ?? this.image,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      host: host ?? this.host,
      guests: guests ?? this.guests,
      location: location ?? this.location,
      tags: tags ?? this.tags,
      rating: rating ?? this.rating,
    );
  }
}

/// A collection of episodes.
///
/// This class is used to manage a collection of episodes, providing
/// functionality to serialize and deserialize a collection of episodes from json.
class EpisodeCollection {
  final Map<int, Episode> episodes;

  EpisodeCollection({required this.episodes});

  factory EpisodeCollection.fromJson(Map<String, dynamic> json) {
    var list = json['episodes'] as List;
    Map<int, Episode> episodes = {
      for (var episode in list)
        Episode.fromJson(episode).id: Episode.fromJson(episode)
    };
    return EpisodeCollection(episodes: episodes);
  }

  Map<String, dynamic> toJson() {
    return {
      'episodes': episodes.values.map((episode) => episode.toJson()).toList(),
    };
  }

  static EpisodeCollection empty() {
    return EpisodeCollection(episodes: {});
  }
}
