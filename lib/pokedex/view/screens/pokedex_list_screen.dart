import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_search_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_list_view_model.dart';
import '../widgets/pokedex_list/pokedex_list_container_widget.dart';

class PokedexListScreen extends StatelessWidget {
  const PokedexListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokedexListViewModel>(context, listen: false)
          .fetchPokemonListData();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Column(
        children: <Widget>[
          Material(
            elevation: 4,
            child: PokedexListSearchWidget()
          ),
          const Expanded(child: PokedexListContainerWidget()),
        ],
      ),
    );
  }
}
