import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../view_model/pokedex_detail_view_model.dart';
import '../widgets/pokedex_detail/pokedex_detail_widget.dart';

class PokedexDetailScreen extends StatefulWidget {
  final String chosenPokemonsUrl;

  PokedexDetailScreen(this.chosenPokemonsUrl);

  @override
  _PokedexDetailScreenState createState() => _PokedexDetailScreenState();
}

class _PokedexDetailScreenState extends State<PokedexDetailScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Provider.of<PokedexDetailViewModel>(context, listen: false)
          .fetchPokemonDetailData(widget.chosenPokemonsUrl);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PokedexDetailWidget());
  }
}
