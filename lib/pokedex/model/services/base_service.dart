import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseService {
  String pokemonBaseUrl = "https://pokeapi.co/api/v2/";

  ///Use Endpoint for specific endpoints
  Future<dynamic> getResponse(String endpoint);

  //For using a full url
  Future<dynamic> getResponseForAbsoluteUrl(String url);

  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw Exception("Invalid Request: ${response.body.toString()}");
      case 401:
      case 403:
      throw Exception("Unauthorised Request: ${response.body.toString()}");
      case 500:
      default:
        throw Exception(
            "Error During Communication: "
                "Error occured while communication with server with status code : "
                "${response.statusCode}");
    }
  }
}

class Endpoint {
  static const String pokemon = "pokemon/?limit=898";
  static const String pokemon_detail = "pokemon/";
}