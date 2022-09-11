import 'package:collection/collection.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_ability_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_species_detail.dart';
import 'package:pokedex/pokedex/model/services/base_service.dart';
import 'package:pokedex/pokedex/model/services/pokedex_service.dart';

class PokedexRepository {
    final BaseService _pokedexService = PokedexService();

    Future<List<Pokemon>> fetchPokemonList() async {
      dynamic response = await _pokedexService.getResponse(Endpoint.pokemon);
      final jsonData = response['results'] as List;
      List<Pokemon> pokemonList = jsonData.mapIndexed((index, json) => Pokemon.fromJson(json, index)).toList();
      return pokemonList;
    }

    Future<PokemonDetail> fetchPokemonDetail(String pokemonUrl) async {
      dynamic response = await _pokedexService.getResponseForAbsoluteUrl(pokemonUrl);
      PokemonDetail pokemonDetail = PokemonDetail.fromJson(response);
      print(pokemonDetail.toString());
      return pokemonDetail;
    }

    Future<PokemonAbilityDetail> fetchPokemonAbility(String pokemonUrl) async {
      dynamic response = await _pokedexService.getResponseForAbsoluteUrl(pokemonUrl);
      PokemonAbilityDetail pokemonAbility = PokemonAbilityDetail.fromJson(response);
      print(pokemonAbility.toString());
      return pokemonAbility;
    }

    Future<PokemonSpeciesDetail> fetchSpeciesAbility(String pokemonUrl) async {
      dynamic response = await _pokedexService.getResponseForAbsoluteUrl(pokemonUrl);
      PokemonSpeciesDetail pokemonAbility = PokemonSpeciesDetail.fromJson(response);
      print(pokemonAbility.toString());
      return pokemonAbility;
    }
}