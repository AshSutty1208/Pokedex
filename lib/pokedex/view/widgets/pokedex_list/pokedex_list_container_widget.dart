import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_widget.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon.dart';

import '../../../consts/app_design_constants/app_colours.dart';
import '../../../view_model/pokedex_list_view_model.dart';

class PokedexListContainerWidget extends StatefulWidget {
  const PokedexListContainerWidget({Key? key}) : super(key: key);

  @override
  _PokedexListContainerWidgetState createState() =>
      _PokedexListContainerWidgetState();
}

class _PokedexListContainerWidgetState
    extends State<PokedexListContainerWidget> {
  Widget buildPokemonList(BuildContext context, List<Pokemon> finalPokemonList,
      bool showNoSearchResultsWidget, bool shouldShowScroller) {
    if (showNoSearchResultsWidget) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Your search came back with no results...\nShowing full list.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColours.secondary),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: PokedexListWidget(finalPokemonList, shouldShowScroller),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 8,
            child: PokedexListWidget(finalPokemonList, shouldShowScroller),
          ),
        ],
      );
    }
  }

  Widget getPokemonWidget(BuildContext context, ApiResponse apiResponse,
      List<Pokemon> initialPokemonList, List<Pokemon>? filteredPokemonList) {
    List<Pokemon> listToUse;
    bool showNoSearchResultsWidget = false;
    bool shouldShowScroller;
    if (filteredPokemonList != null) {
      if (filteredPokemonList.isEmpty) {
        listToUse = initialPokemonList;
        showNoSearchResultsWidget = true;
        shouldShowScroller = true;
      } else {
        listToUse = filteredPokemonList;
        shouldShowScroller = false;
      }
    } else {
      listToUse = initialPokemonList;
      shouldShowScroller = true;
    }

    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
            child: SpinKitWave(
          color: Colors.redAccent,
          size: 30,
        ));
      case Status.COMPLETED:
        return buildPokemonList(context, listToUse, showNoSearchResultsWidget, shouldShowScroller);
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

    return getPokemonWidget(
        context, apiResponse, initialPokemonList, filteredPokemonList);
  }
}
