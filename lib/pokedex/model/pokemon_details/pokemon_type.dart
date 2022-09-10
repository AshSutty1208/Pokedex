import 'package:flutter/material.dart';

import '../../consts/app_design_constants/colors_util.dart';
import '../../extensions/string_extension.dart';

/// Class that represents a Pokemons Specific Detail
class PokemonType {
  final String url;
  final String name;
  final Color pokemonTypeColor;

  PokemonType({required this.pokemonTypeColor, required this.url,
    required this.name});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> typeJson = json['type'];

    String name = (typeJson['name'] as String).capitalize();

    return PokemonType(pokemonTypeColor: ColorsUtil.getColorForPokemonType(name),
      url: typeJson['url'] as String,
        name: name,);
  }

  Widget getPokemonTypeTextWidget() {
    return Padding(padding: EdgeInsets.only(left: 4), child: Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: pokemonTypeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              name,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ))),);
  }

  @override
  String toString() {
    return "url: $url"
        " Name: $name";
  }
}