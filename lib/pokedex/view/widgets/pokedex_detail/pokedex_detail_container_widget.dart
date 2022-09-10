import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokedex_detail_widget.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';

import '../../../view_model/pokedex_detail_view_model.dart';

class PokedexDetailContainerWidget extends StatefulWidget {
  @override
  _PokedexDetailContainerWidgetState createState() => _PokedexDetailContainerWidgetState();
}

class _PokedexDetailContainerWidgetState extends State<PokedexDetailContainerWidget> {

  Widget getPokemonDetailWidget(BuildContext context,
      ApiResponse apiResponse,
      PokemonDetail? pokemonDetail) {

    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        if (pokemonDetail == null) {
          return const Center(
            child: Text('Please try again later...'),
          );
        }
        return PokedexDetailWidget(pokemonDetail);
      case Status.ERROR:
        return const Center(
          child: Text('Please try again later...'),
        );
      case Status.INITIAL:
        return const Center(child: CircularProgressIndicator());
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse =
        Provider.of<PokedexDetailViewModel>(context).response;
    PokemonDetail? pokemonDetail =
        Provider.of<PokedexDetailViewModel>(context).pokemonDetail;

    return getPokemonDetailWidget(context, apiResponse, pokemonDetail);
  }
}
