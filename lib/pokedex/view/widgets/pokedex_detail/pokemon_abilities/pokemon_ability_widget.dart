import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';
import 'package:pokedex/pokedex/view/widgets/reusable_widgets/inner_card_container_with_title.dart';
import 'package:pokedex/pokedex/view_model/poxedex_abilities_view_model.dart';
import 'package:provider/provider.dart';

class PokemonAbilityWidget extends StatelessWidget {
  final String abilityName;

  PokemonAbilityWidget(this.abilityName);

  String getEffectEntryForAbilityName(List<PokemonAbilityDetail> pokemonAbilityDetail) {
    for (var element in pokemonAbilityDetail) {
      if (element.name.toLowerCase() == abilityName.toLowerCase()) {
        return element.effectEntry;
      }
    }
    return "No description for ability...";
  }

  Widget getPokemonDetailWidget(BuildContext context, ApiResponse apiResponse,
      List<PokemonAbilityDetail> pokemonAbilityDetail) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: SpinKitWave(color: Colors.white, size: 30,));
      case Status.COMPLETED:
        if (pokemonAbilityDetail.isEmpty) {
          return const Center(
            child: Text('Please try again later...'),
          );
        }
        return Text(getEffectEntryForAbilityName(pokemonAbilityDetail), style: TextStyle(color: Colors.white),);
      case Status.ERROR:
        return const Center(
          child: Text('Please try again later...'),
        );
      case Status.INITIAL:
        return const Center(child: SpinKitWave(color: Colors.white, size: 30,));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<PokedexAbilitiesViewModel>(context)
        .pokemonAbilityApiResponse;
    List<PokemonAbilityDetail> pokemonAbilityDetail =
        Provider.of<PokedexAbilitiesViewModel>(context).pokemonAbilityDetail;

    return InnerCardContainerWithTitle(
        titleText: abilityName,
        child:
            getPokemonDetailWidget(context, apiResponse, pokemonAbilityDetail));
  }
}
