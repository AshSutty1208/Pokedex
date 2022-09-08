import 'package:http/http.dart' as http;

import 'package:pokedex/pokedex/model/services/base_service.dart';

class PokedexService extends BaseService {
  @override
  Future getResponse(String endpoint) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(pokemonBaseUrl + endpoint));
      responseJson = super.handleResponse(response);
    } catch(e) {
      print("Error in http request: $e");
    }

    return responseJson;
  }

  @override
  Future getResponseForAbsoluteUrl(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url));
      responseJson = super.handleResponse(response);
    } catch(e) {
      print("Error in http request: $e");
    }

    return responseJson;
  }
}