import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_list_view_model.dart';
import '../widgets/pokedex_list/pokedex_list_container_widget.dart';

class PokedexListScreen extends StatelessWidget {
  const PokedexListScreen({Key? key}) : super(key: key);

  _getPokemonList(BuildContext buildContext) async {
    Future.delayed(const Duration(seconds: 1), () {
      Provider.of<PokedexListViewModel>(buildContext,
          listen: false)
          .fetchPokemonListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    _getPokemonList(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.secondary.withAlpha(40),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                        controller: _inputController,
                        onChanged: (value) {
                            Provider.of<PokedexListViewModel>(context, listen: false).filterPokemonListBySearchResults(value);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                          hintText: 'Enter Pokemon Name',
                        )),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: PokedexListContainerWidget()),
        ],
      ),
    );
  }
}
