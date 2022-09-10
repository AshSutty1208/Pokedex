import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_detail_view_model.dart';
import '../widgets/pokedex_detail/pokedex_detail_container_widget.dart';

class PokedexDetailScreen extends StatelessWidget {
  final String chosenPokemonsUrl;

  const PokedexDetailScreen(this.chosenPokemonsUrl, {Key? key}) : super(key: key);

  _getPokemonDetail(BuildContext buildContext) {
    Provider.of<PokedexDetailViewModel>(buildContext,
        listen: false)
        .fetchPokemonDetailData(chosenPokemonsUrl);
  }

  @override
  Widget build(BuildContext context) {
    _getPokemonDetail(context);

    return Scaffold(body: PokedexDetailContainerWidget());
  }
}
