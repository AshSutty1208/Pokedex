import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/view_model/pokedex_detail_view_model.dart';
import 'package:pokedex/pokedex/view_model/pokedex_list_view_model.dart';
import 'package:pokedex/pokedex/view/screens/pokedex_list_screen.dart';
import 'package:pokedex/pokedex/view_model/poxedex_abilities_view_model.dart';
import 'package:pokedex/pokedex/view_model/poxedex_species_view_model.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/model/pokemon_repository.dart';

void main() => runApp(const PokedexApp());

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColours.secondary
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PokedexListViewModel()),
        ChangeNotifierProvider.value(value: PokedexDetailViewModel()),
        ChangeNotifierProvider.value(value: PokedexAbilitiesViewModel()),
        ChangeNotifierProvider.value(value: PokedexSpeciesViewModel())
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
