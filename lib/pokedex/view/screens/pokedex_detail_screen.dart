import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_detail_view_model.dart';
import '../widgets/pokedex_detail/pokedex_detail_container_widget.dart';

class PokedexDetailScreen extends StatelessWidget {
  final String chosenPokemonsUrl;

  const PokedexDetailScreen(this.chosenPokemonsUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokedexDetailViewModel>(context,
          listen: false)
          .fetchPokemonDetailData(chosenPokemonsUrl);
    });

    return Scaffold(body: PokedexDetailContainerWidget(chosenPokemonsUrl));
  }
}
