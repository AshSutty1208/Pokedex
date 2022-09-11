import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_widget.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon.dart';

import '../../../view_model/pokedex_list_view_model.dart';

class PokedexListContainerWidget extends StatefulWidget {
  const PokedexListContainerWidget({Key? key}) : super(key: key);

  @override
  _PokedexListContainerWidgetState createState() => _PokedexListContainerWidgetState();
}

class _PokedexListContainerWidgetState extends State<PokedexListContainerWidget> {
  Widget buildPokemonList(BuildContext context,
      List<Pokemon> finalPokemonList,
      bool showNoSearchResultsWidget) {
    if(showNoSearchResultsWidget) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            flex: 1,
            child: Text("Your search came back with no results...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 9,
            child: PokedexListWidget(finalPokemonList),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 8,
            child: PokedexListWidget(finalPokemonList),
          ),
        ],
      );
    }
  }

  Widget getPokemonWidget(BuildContext context,
      ApiResponse apiResponse,
      List<Pokemon> initialPokemonList,
      List<Pokemon>? filteredPokemonList) {
    List<Pokemon> listToUse;
    bool showNoSearchResultsWidget = false;
    if (filteredPokemonList != null) {
      if(filteredPokemonList.isEmpty) {
        listToUse = initialPokemonList;
        showNoSearchResultsWidget = true;
      } else {
        listToUse = filteredPokemonList;
      }
    } else {
      listToUse = initialPokemonList;
    }

    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: SpinKitWave(color: Colors.redAccent, size: 30,));
      case Status.COMPLETED:
        return buildPokemonList(context, listToUse, showNoSearchResultsWidget);
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
        Provider.of<PokedexListViewModel>(context).response;
    List<Pokemon> initialPokemonList =
        Provider.of<PokedexListViewModel>(context).pokemonList;
    List<Pokemon>? filteredPokemonList =
        Provider.of<PokedexListViewModel>(context).searchFilteredPokemonList;

    return getPokemonWidget(context, apiResponse, initialPokemonList, filteredPokemonList);
  }
}
