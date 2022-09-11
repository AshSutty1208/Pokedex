import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';

import '../../extensions/string_extension.dart';

class PokemonAbilityDetail {
  final int id;
  final String effectEntry;
  final String name;

  PokemonAbilityDetail({required this.name, required this.id, required this.effectEntry});

  factory PokemonAbilityDetail.fromJson(Map<String, dynamic> json) {
    String parsedEffectEntry = "There is no description for this ability";
    try {
      for (var element in (json['effect_entries'] as List)) {
        Map<String, dynamic> languageObj = element['language'];
        if (languageObj['name'] == "en") {
          parsedEffectEntry = element['short_effect'];
        }
      }
    } catch (e) {
      print("Error parsing abilitity detail: $e");
    }

    return PokemonAbilityDetail(name: json['name'] as String, effectEntry: parsedEffectEntry, id: json['id'] as int);
  }

  @override
  String toString() {
    return "effectEntry: $effectEntry";
  }
}