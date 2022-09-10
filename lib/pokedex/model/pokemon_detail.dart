import 'package:collection/src/iterable_extensions.dart';
import 'package:pokedex/pokedex/model/pokemon_details/abilities.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_type.dart';

import '../extensions/string_extension.dart';

/// Class that represents a Pokemons Specific Detail
class PokemonDetail {
  final int id;
  final String name;
  final int baseExperience;
  final int weight;
  final int height;
  final bool isDefault;
  final String locationAreasUrl;
  final List<PokemonType> pokemonTypes;
  // final List<Abilities> abilities;

  PokemonDetail({required this.weight,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.locationAreasUrl,
    required this.id,
    required this.name,
    required this.pokemonTypes});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    String name = (json['name'] as String).capitalize();

    final jsonTypes = json['types'] as List;
    List<PokemonType> parsedTypes = jsonTypes.map((json) => PokemonType.fromJson(json)).toList();

    return PokemonDetail(id: json['id'] as int,
      name: name,
      weight: json['weight'] as int,
      height: json['height'] as int,
      baseExperience: json['base_experience'] as int,
      isDefault: json['is_default'] as bool,
      locationAreasUrl: json['location_area_encounters'] as String,
      pokemonTypes: parsedTypes);
  }

  @override
  String toString() {
    return "ID: $id"
        " Name: $name"
        " baseExperience: $baseExperience"
        " Height: $height"
        " Weight: $weight"
        " isDefault: $isDefault"
        " locationAreasUrl: $locationAreasUrl"
        " types: $pokemonTypes";
  }
}