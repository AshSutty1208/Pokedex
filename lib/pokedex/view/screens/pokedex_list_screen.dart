import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_search_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_list_view_model.dart';
import '../widgets/pokedex_list/pokedex_list_container_widget.dart';

class PokedexListScreen extends StatelessWidget {
  const PokedexListScreen({Key? key}) : super(key: key);

  _getPokemonList(BuildContext buildContext) async {
    Future.delayed(const Duration(seconds: 1), () {
      Provider.of<PokedexListViewModel>(buildContext, listen: false)
          .fetchPokemonListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _getPokemonList(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Column(
        children: <Widget>[
          PokedexListSearchWidget(),
          const Expanded(child: PokedexListContainerWidget()),
        ],
      ),
    );
  }
}
