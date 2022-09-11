import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';

import '../model/pokemon_repository.dart';

class PokedexAbilitiesViewModel with ChangeNotifier {
  ApiResponse _pokemonAbilityResponse = ApiResponse.initial('Empty data');

  ApiResponse get pokemonAbilityApiResponse {
    return _pokemonAbilityResponse;
  }

  final List<PokemonAbilityDetail> _pokemonAbilityDetail = [];

  List<PokemonAbilityDetail> get pokemonAbilityDetail {
    return _pokemonAbilityDetail;
  }

  Future<void> fetchPokemonAbilityData(pokemonUrl) async {
    _pokemonAbilityResponse = ApiResponse.loading('Fetching pokemon ability data');
    notifyListeners();
    try {
      PokemonAbilityDetail pokemonAbility =
      await PokedexRepository().fetchPokemonAbility(pokemonUrl);
      _pokemonAbilityDetail.add(pokemonAbility);
      _pokemonAbilityResponse = ApiResponse.completed(pokemonAbilityDetail);
      notifyListeners();
    } catch (e) {
      _pokemonAbilityResponse = ApiResponse.error(e.toString());
      print(e);
      notifyListeners();
    }
  }
}
