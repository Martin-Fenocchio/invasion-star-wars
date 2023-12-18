// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

List<Character> characterFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String characterToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final Gender gender;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;
  final String image;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.image,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  Character copyWith({
    String? name,
    String? height,
    String? mass,
    String? hairColor,
    String? image,
    String? skinColor,
    String? eyeColor,
    String? birthYear,
    Gender? gender,
    String? homeworld,
    List<String>? films,
    List<String>? species,
    List<String>? vehicles,
    List<String>? starships,
    DateTime? created,
    DateTime? edited,
    String? url,
  }) =>
      Character(
        image: image ?? this.image,
        name: name ?? this.name,
        height: height ?? this.height,
        mass: mass ?? this.mass,
        hairColor: hairColor ?? this.hairColor,
        skinColor: skinColor ?? this.skinColor,
        eyeColor: eyeColor ?? this.eyeColor,
        birthYear: birthYear ?? this.birthYear,
        gender: gender ?? this.gender,
        homeworld: homeworld ?? this.homeworld,
        films: films ?? this.films,
        species: species ?? this.species,
        vehicles: vehicles ?? this.vehicles,
        starships: starships ?? this.starships,
        created: created ?? this.created,
        edited: edited ?? this.edited,
        url: url ?? this.url,
      );

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        image: json["image"] ?? '',
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: genderValues.map[json["gender"]] ?? Gender.N_A,
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  String getId() {
    final List<String> urlParts = url.split('/');
    return urlParts[urlParts.length - 2];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": genderValues.reverse[gender],
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

enum Gender { FEMALE, MALE, N_A }

final genderValues = EnumValues(
    {"female": Gender.FEMALE, "male": Gender.MALE, "n/a": Gender.N_A});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

extension GenderExtension on Gender {
  String getName() {
    switch (this) {
      case Gender.FEMALE:
        return 'Femenina';
      case Gender.MALE:
        return 'Masculino';
      case Gender.N_A:
        return 'Gálactico';
    }
  }
}
