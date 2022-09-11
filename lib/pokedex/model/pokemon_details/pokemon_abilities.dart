import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';

import '../../extensions/string_extension.dart';

/// Class that represents a Pokemons Specific Detail
class PokemonAbilities {
  final bool isHidden;
  final int slot;
  final PokemonAbility ability;

  PokemonAbilities({required this.isHidden,
    required this.slot, required this.ability});

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) {

    PokemonAbility parsedAbility = PokemonAbility.fromJson(json['ability']);

    return PokemonAbilities(isHidden: json['is_hidden'] as bool,
        slot: json['slot'] as int, ability: parsedAbility);
  }

  @override
  String toString() {
    return "isHidden: $isHidden, Slot: $slot, Ability: $ability";
  }
}