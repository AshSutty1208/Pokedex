import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_abilities/pokemon_abilities_widget.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokemon_characteristics/pokemon_characteristics_widget.dart';
import 'package:pokedex/pokedex/view/widgets/reusable_widgets/list_card_container.dart';

class PokdexDetailListContainerWidget extends StatelessWidget {
  final PokemonDetail pokemonDetail;

  const PokdexDetailListContainerWidget(this.pokemonDetail, {Key? key})
      : super(key: key);

  BoxDecoration getBackground() {
    if (pokemonDetail.pokemonTypes.length > 1) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            pokemonDetail.pokemonTypes[0].pokemonTypeColor.withAlpha(180),
            pokemonDetail.pokemonTypes[1].pokemonTypeColor.withAlpha(180)
          ]
        ),
      );
    } else {
      return BoxDecoration(
        gradient: LinearGradient(
            colors: [
              pokemonDetail.pokemonTypes[0].pokemonTypeColor.withAlpha(180),
              pokemonDetail.pokemonTypes[0].pokemonTypeColor.withAlpha(100)
            ]
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final listBodyWidgets = Container(
        decoration: getBackground(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListCardContainer(child: PokemonCharacteristicsWidget(pokemonDetail.pokemonSpecies)),
            ListCardContainer(child: PokemonAbilitiesWidget(pokemonDetail))
          ],
        ));

    return listBodyWidgets;
  }
}
