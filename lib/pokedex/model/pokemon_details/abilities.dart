import 'package:pokedex/pokedex/model/pokemon_details/ability.dart';

import '../../extensions/string_extension.dart';

/// Class that represents a Pokemons Specific Detail
class Abilities {
  final bool isHidden;
  final int slot;
  Ability? ability;

  Abilities({required this.isHidden,
    required this.slot, this.ability});

  factory Abilities.fromJson(Map<String, dynamic> json) {

    return Abilities(isHidden: json['is_hidden'] as bool,
        slot: json['slot'] as int);
  }

  @override
  String toString() {
    return "isHidden: $isHidden, Slot: $slot, Ability: $ability";
  }
}