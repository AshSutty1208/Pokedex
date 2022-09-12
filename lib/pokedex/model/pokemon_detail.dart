import 'package:pokedex/pokedex/model/pokemon_details/pokemon_abilities.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species.dart';
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
  final List<PokemonAbilities> pokemonAbilities;
  final PokemonSpecies pokemonSpecies;

  PokemonDetail({required this.weight,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.locationAreasUrl,
    required this.id,
    required this.name,
    required this.pokemonTypes,
    required this.pokemonAbilities,
    required this.pokemonSpecies});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    String name = (json['name'] as String).capitalize();

    final jsonTypes = json['types'] as List;
    List<PokemonType> parsedTypes = jsonTypes.map((json) => PokemonType.fromJson(json)).toList();

    final jsonAbilities = json['abilities'] as List;
    List<PokemonAbilities> parsedAbilities = jsonAbilities.map((json) => PokemonAbilities.fromJson(json)).toList();

    final jsonSpecies = json['species'];
    PokemonSpecies pokemonSpecies = PokemonSpecies.fromJson(jsonSpecies, json['id'] as int);

    return PokemonDetail(id: json['id'] as int,
      name: name,
      weight: json['weight'] ??= 0,
      height: json['height'] ??= 0,
      baseExperience: json['base_experience'] ??= 0,
      isDefault: json['is_default'] ??= false,
      locationAreasUrl: json['location_area_encounters'] ??= "",
      pokemonTypes: parsedTypes,
      pokemonAbilities: parsedAbilities,
      pokemonSpecies: pokemonSpecies);
  }

  @override
  String toString() {
    return "ID: $id\n"
        " Name: $name\n"
        " baseExperience: $baseExperience\n"
        " Height: $height\n"
        " Weight: $weight\n"
        " isDefault: $isDefault\n"
        " locationAreasUrl: $locationAreasUrl\n"
        " types: $pokemonTypes \n"
        " abilities: $pokemonAbilities"
        " species: $pokemonSpecies";
  }
}