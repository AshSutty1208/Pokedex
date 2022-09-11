import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/text_styles.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_abilities/pokemon_ability_container.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_characteristics/pokemon_characteristic_container.dart';
import 'package:pokedex/pokedex/view_model/poxedex_species_view_model.dart';
import 'package:provider/provider.dart';

class PokemonCharacteristicsWidget extends StatefulWidget {
  final PokemonSpecies pokemonSpecies;

  PokemonCharacteristicsWidget(this.pokemonSpecies);

  @override
  _PokemonCharacteristicsWidgetState createState() =>
      _PokemonCharacteristicsWidgetState();
}

class _PokemonCharacteristicsWidgetState
    extends State<PokemonCharacteristicsWidget> {
  Widget _pokemonCharacteristicsDetailsWidget(BuildContext context) {
    return WillPopScope(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Pokemon Characteristics",
              textAlign: TextAlign.center,
              style: TextStyles.cardTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                color: AppColours.secondary,
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 2, maxHeight: 2),
              ),
            ),
            Container(
                constraints: BoxConstraints(maxWidth: double.infinity),
                child: PokemonCharacteristicContainer(widget.pokemonSpecies)),
          ],
        ),
      ),
      onWillPop: () async {
        Provider.of<PokedexSpeciesViewModel>(context, listen: false)
            .disposeProvidedValues();
        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _pokemonCharacteristicsDetailsWidget(context);
  }
}
