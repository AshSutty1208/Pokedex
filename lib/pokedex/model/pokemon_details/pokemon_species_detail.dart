import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';

import '../../extensions/string_extension.dart';

class PokemonSpeciesDetail {
  final String growthRate;
  final String habitat;
  final String description;
  final int captureRate;
  final String shape;

  PokemonSpeciesDetail({
    required this.growthRate,
    required this.habitat,
    required this.description,
    required this.captureRate,
    required this.shape
  });

  factory PokemonSpeciesDetail.fromJson(Map<String, dynamic> json) {
    final growthRateJson = json['growth_rate'];
    final growthRate = (growthRateJson['name'] as String).capitalize();

    String habitat = "No Habitat Found";
    final habitatJson = json['habitat'];
    if (habitatJson != null) {
      habitat = (habitatJson['name'] as String).capitalize();
    }


    String description = "";
    final flavourTextJson = json['flavor_text_entries'] as List;
    for(var flavor in flavourTextJson) {
      final languageObj = flavor['language'];
      if (languageObj['name'] == "en") {
        description = flavor['flavor_text'] as String;
      }
    }

    final shapeJson = json['shape'];
    String shape = "No Shape Found";
    if (shapeJson != null) {
      shape = (shapeJson['name'] as String).capitalize();
    }

    return PokemonSpeciesDetail(growthRate: growthRate,
        habitat: habitat,
        description: description,
        captureRate: json['capture_rate'] as int,
        shape: shape
    );
  }

  @override
  String toString() {
    return
      "growthRate: $growthRate"
      "habitat: $habitat"
      "description: $description"
      "captureRate: $captureRate"
      "shape: $shape";
  }
}