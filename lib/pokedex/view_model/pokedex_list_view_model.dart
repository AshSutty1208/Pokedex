import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon.dart';

import '../model/pokemon_repository.dart';

class PokedexListViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  List<Pokemon> _pokemonList = List.empty();

  List<Pokemon> get pokemonList {
    return _pokemonList;
  }

  List<Pokemon>? _searchFilteredPokemonList;

  List<Pokemon>? get searchFilteredPokemonList {
    return _searchFilteredPokemonList;
  }

  Future<void> fetchPokemonListData() async {
    _apiResponse = ApiResponse.loading('Fetching pokemon data');
    notifyListeners();
    try {
      List<Pokemon> pokemonList = await PokedexRepository().fetchPokemonList();
      _apiResponse = ApiResponse.completed(pokemonList);
      _pokemonList = pokemonList;
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void filterPokemonListBySearchResults(dynamic value) {
    _searchFilteredPokemonList = List.empty();

    var valueAsInt = int.tryParse(value);
    if (valueAsInt != null) {
      _searchFilteredPokemonList = List.from(pokemonList);
      _searchFilteredPokemonList!.removeWhere((element) {
        String pokedexNumber = element.pokedexNumber.toString();
        return !pokedexNumber.contains(value);
      });
    } else if (value is String) {
      String lowercasedValue = value.toLowerCase();

      _searchFilteredPokemonList = List.from(pokemonList);
      _searchFilteredPokemonList!.removeWhere((element) {
        String elementLowercase = element.name.toLowerCase();
        return !elementLowercase.contains(lowercasedValue);
      });
    }

    notifyListeners();
  }

  void clearPokemonListSearch() {
    _searchFilteredPokemonList = null;

    notifyListeners();
  }
}