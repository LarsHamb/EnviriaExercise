import 'package:flutter/widgets.dart';

class Person {
  final int id;
  final String name;
  final String role;
  final String bio;
  final String profileImageUrl;
  final Image? image;
  final SocialLinks socialLinks;

  Person({
    required this.id,
    required this.name,
    required this.role,
    required this.bio,
    required this.profileImageUrl,
    required this.socialLinks,
    this.image,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      bio: json['bio'],
      profileImageUrl: json['profileImageUrl'],
      socialLinks: SocialLinks.fromJson(json['socialLinks']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'socialLinks': socialLinks.toJson(),
    };
  }
}

class SocialLinks {
  final String? twitter;
  final String? linkedin;
  final String? website;

  SocialLinks({
    required this.twitter,
    this.linkedin,
    this.website,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'twitter': twitter,
      'linkedin': linkedin,
      'website': website,
    };
  }
}

class PeopleCollection {
  final Map<int, Person> people;

  PeopleCollection({required this.people});

  factory PeopleCollection.fromJson(Map<String, dynamic> json) {
    var list = json['people'] as List;
    Map<int, Person> people = {
      for (var people in list)
        Person.fromJson(people).id: Person.fromJson(people)
    };
    return PeopleCollection(people: people);
  }

  Map<String, dynamic> toJson() {
    return {
      'people': people.values.map((e) => e.toJson()).toList(),
    };
  }

  static PeopleCollection empty() {
    return PeopleCollection(people: {});
  }
}
