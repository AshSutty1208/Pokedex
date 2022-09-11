import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/text_styles.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species_detail.dart';
import 'package:pokedex/pokedex/view/widgets/reusable_widgets/inner_card_container_with_title.dart';
import 'package:pokedex/pokedex/view_model/poxedex_abilities_view_model.dart';
import 'package:pokedex/pokedex/view_model/poxedex_species_view_model.dart';
import 'package:provider/provider.dart';

class PokemonCharacteristicWidget extends StatelessWidget {
  final String speciesName;

  PokemonCharacteristicWidget(this.speciesName);

  Widget getCharacteristicsDetailWidget(
      BuildContext context, PokemonSpeciesDetail pokemonSpeciesDetail) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InnerCardContainerWithTitle(
          titleText: "Description",
          child: Text(
            pokemonSpeciesDetail.description,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: double.infinity),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InnerCardContainerWithTitle(
                  titleText: "Habitat",
                  child: Text(
                    pokemonSpeciesDetail.habitat,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: InnerCardContainerWithTitle(
                  titleText: "Growth Rate",
                  child: Text(
                    pokemonSpeciesDetail.growthRate,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: double.infinity),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InnerCardContainerWithTitle(
                  titleText: "Capture Rate",
                  child: Text(
                    pokemonSpeciesDetail.captureRate.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: InnerCardContainerWithTitle(
                  titleText: "Shape",
                  child: Text(
                    pokemonSpeciesDetail.shape,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getPokemonDetailWidget(BuildContext context, ApiResponse apiResponse,
      PokemonSpeciesDetail? pokemonSpeciesDetail) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return Container(
            constraints:
            BoxConstraints(minWidth: double.infinity, minHeight: 200),
            child: const Center(
                child: SpinKitWave(
                  color: AppColours.secondary,
                  size: 30,
                )));
      case Status.COMPLETED:
        if (pokemonSpeciesDetail == null) {
          return const Center(
            child: Text('Please try again later...'),
          );
        }
        return getCharacteristicsDetailWidget(context, pokemonSpeciesDetail);
      case Status.ERROR:
        return const Center(
          child: Text('Please try again later...'),
        );
      case Status.INITIAL:
        return Container(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 200),
            child: const Center(
                child: SpinKitWave(
              color: AppColours.secondary,
              size: 30,
            )));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse =
        Provider.of<PokedexSpeciesViewModel>(context).pokemonSpeciesApiResponse;
    PokemonSpeciesDetail? pokemonSpeciesDetail =
        Provider.of<PokedexSpeciesViewModel>(context).pokemonSpeciesDetail;

    return getPokemonDetailWidget(context, apiResponse, pokemonSpeciesDetail);
  }
}
