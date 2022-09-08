import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/view_model/pokedex_detail_view_model.dart';
import 'package:pokedex/pokedex/view_model/pokedex_list_view_model.dart';
import 'package:pokedex/pokedex/view/screens/pokedex_list_screen.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/model/pokemon_repository.dart';

void main() => runApp(const PokedexApp());

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PokedexListViewModel()),
        ChangeNotifierProvider.value(value: PokedexDetailViewModel())
      ],
      child: MaterialApp(
        title: "Pokedex",
        theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red, accentColor: Colors.redAccent)),
        initialRoute: '/',
        routes: {
            '/': (context) => const PokedexListScreen()
        },
      ),
    );
  }
}
