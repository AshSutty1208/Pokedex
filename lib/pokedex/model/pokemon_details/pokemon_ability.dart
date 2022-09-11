import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';

import '../../extensions/string_extension.dart';

class PokemonAbility {
  final String name;
  final String url;

  PokemonAbility({required this.name,
    required this.url});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    String name = (json['name'] as String).capitalize();
    return PokemonAbility(name: name,
        url: json['url'] as String);
  }

  @override
  String toString() {
    return "name: $name, url: $url";
  }
}