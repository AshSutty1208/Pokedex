import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_characteristics/pokemon_characteristic_widget.dart';
import 'package:pokedex/pokedex/view_model/poxedex_species_view_model.dart';
import 'package:provider/provider.dart';

class PokemonCharacteristicContainer extends StatelessWidget {
  final PokemonSpecies pokemonSpecies;

  const PokemonCharacteristicContainer(this.pokemonSpecies, {Key? key}) : super(key: key);

  _getPokemonSpeciesDetail(BuildContext buildContext) {
    Provider.of<PokedexSpeciesViewModel>(buildContext,
        listen: false).fetchPokemonSpeciesData(pokemonSpecies.url);
  }

  @override
  Widget build(BuildContext context) {
    _getPokemonSpeciesDetail(context);

    return PokemonCharacteristicWidget(pokemonSpecies.name);
  }
}
