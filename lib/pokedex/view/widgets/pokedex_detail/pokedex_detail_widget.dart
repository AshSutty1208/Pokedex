import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';

import '../../../view_model/pokedex_detail_view_model.dart';

class PokedexDetailWidget extends StatefulWidget {
  @override
  _PokedexDetailWidgetState createState() => _PokedexDetailWidgetState();
}

class _PokedexDetailWidgetState extends State<PokedexDetailWidget> {
  Widget getPokemonDetailWidget(BuildContext context,
      ApiResponse apiResponse,
      PokemonDetail? pokemonDetail) {

    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Container();
      case Status.ERROR:
        return const Center(
          child: Text('Please try again later...'),
        );
      case Status.INITIAL:
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
