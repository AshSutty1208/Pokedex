import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/text_styles.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_abilities.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_abilities/pokemon_ability_container.dart';
import 'package:pokedex/pokedex/view_model/pokedex_detail_view_model.dart';
import 'package:pokedex/pokedex/view_model/poxedex_abilities_view_model.dart';
import 'package:provider/provider.dart';

class PokemonAbilitiesWidget extends StatefulWidget {
  final PokemonDetail pokemonDetail;

  PokemonAbilitiesWidget(this.pokemonDetail);

  @override
  _PokemonAbilitiesWidgetState createState() => _PokemonAbilitiesWidgetState();
}

class _PokemonAbilitiesWidgetState extends State<PokemonAbilitiesWidget> {
  Widget _pokemonAbilityDetailsWidget(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Provider.of<PokedexAbilitiesViewModel>(context,
              listen: false).disposeProvidedValues();
          return true;
        },
        child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Pokemon Abilities",
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
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getPokemonAbilityWidgets(context)),
        ],
      ),
    ));
  }

  List<Widget> _getPokemonAbilityWidgets(BuildContext context) {
    List<Widget> widgets = [];
    for(PokemonAbilities pokemonAbilities in widget.pokemonDetail.pokemonAbilities) {
      widgets.add(PokemonAbilityContainer(pokemonAbilities.ability));
    }

    if (widgets.isEmpty) {
      widgets.add(const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          "No Abilities to display...",
          textAlign: TextAlign.left,
          style: TextStyles.h1CardBody,
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return _pokemonAbilityDetailsWidget(context);
  }
}
