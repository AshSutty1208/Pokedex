import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_abilities/pokemon_ability_widget.dart';
import 'package:pokedex/pokedex/view_model/poxedex_abilities_view_model.dart';
import 'package:provider/provider.dart';

class PokemonAbilityContainer extends StatelessWidget {
  final PokemonAbility pokemonAbility;

  const PokemonAbilityContainer(this.pokemonAbility, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokedexAbilitiesViewModel>(context,
          listen: false).fetchPokemonAbilityData(pokemonAbility.url);
    });

    return PokemonAbilityWidget(pokemonAbility.name);
  }
}
