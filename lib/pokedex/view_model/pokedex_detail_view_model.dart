import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';

import '../model/pokemon_repository.dart';

class PokedexDetailViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  PokemonDetail? _pokemonDetail;

  PokemonDetail? get pokemonDetail {
    return _pokemonDetail;
  }

  Future<void> fetchPokemonDetailData(pokemonUrl) async {
    _apiResponse = ApiResponse.loading('Fetching pokemon data');
    notifyListeners();
    try {
      PokemonDetail pokemon =
          await PokedexRepository().fetchPokemonDetail(pokemonUrl);
      _pokemonDetail = pokemon;
      _apiResponse = ApiResponse.completed(pokemonDetail);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
      notifyListeners();
    }
  }
}