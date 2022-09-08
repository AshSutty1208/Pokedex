import 'package:collection/collection.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/model/services/base_service.dart';
import 'package:pokedex/pokedex/model/services/pokedex_service.dart';

class PokedexRepository {
    final BaseService _pokedexService = PokedexService();

    Future<List<Pokemon>> fetchPokemonList() async {
      dynamic response = await _pokedexService.getResponse(Endpoint.pokemon);
      final jsonData = response['results'] as List;
      List<Pokemon> pokemonList = jsonData.mapIndexed((index, json) => Pokemon.fromJson(json, index)).toList();
      for(Pokemon pokemon in pokemonList) {
        print(pokemon.toString());
      }
      return pokemonList;
    }
}