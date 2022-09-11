import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species_detail.dart';

import '../model/pokemon_repository.dart';

class PokedexSpeciesViewModel with ChangeNotifier {
  ApiResponse _pokemonSpeciesResponse = ApiResponse.initial('Empty data');

  ApiResponse get pokemonSpeciesApiResponse {
    return _pokemonSpeciesResponse;
  }

  PokemonSpeciesDetail? _pokemonSpeciesDetail;

  PokemonSpeciesDetail? get pokemonSpeciesDetail {
    return _pokemonSpeciesDetail;
  }

  Future<void> fetchPokemonSpeciesData(pokemonUrl) async {
    _pokemonSpeciesResponse = ApiResponse.loading('Fetching pokemon species data');
    notifyListeners();
    try {
      PokemonSpeciesDetail pokemonSpecies =
      await PokedexRepository().fetchSpeciesAbility(pokemonUrl);
      _pokemonSpeciesDetail = pokemonSpecies;
      _pokemonSpeciesResponse = ApiResponse.completed(pokemonSpeciesDetail);
      notifyListeners();
    } catch (e) {
      _pokemonSpeciesResponse = ApiResponse.error(e.toString());
      print(e);
      notifyListeners();
    }
  }
}
