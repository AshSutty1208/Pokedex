import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';

import '../model/pokemon_repository.dart';

class PokedexDetailViewModel with ChangeNotifier {
  ApiResponse _pokemonDetailResponse = ApiResponse.initial('Empty data');

  ApiResponse get pokemonDetailApiResponse {
    return _pokemonDetailResponse;
  }

  ApiResponse _pokemonAbilityResponse = ApiResponse.initial('Empty data');

  ApiResponse get pokemonAbilityApiResponse {
    return _pokemonAbilityResponse;
  }

  PokemonDetail? _pokemonDetail;

  PokemonDetail? get pokemonDetail {
    return _pokemonDetail;
  }

  Future<void> fetchPokemonDetailData(pokemonUrl) async {
    _pokemonDetailResponse = ApiResponse.loading('Fetching pokemon data');
    notifyListeners();
    try {
      PokemonDetail pokemon =
          await PokedexRepository().fetchPokemonDetail(pokemonUrl);
      _pokemonDetail = pokemon;
      _pokemonDetailResponse = ApiResponse.completed(pokemonDetail);
      notifyListeners();
    } catch (e) {
      _pokemonDetailResponse = ApiResponse.error(e.toString());
      print(e);
      notifyListeners();
    }
  }
}
