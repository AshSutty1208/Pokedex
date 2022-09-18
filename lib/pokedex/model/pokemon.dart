import '../extensions/string_extension.dart';

/// Class that represents a Pokemon for a list
class Pokemon {
  final String name;
  final String url;
  final int pokedexNumber;
  final String displayPokedexNum;

  Pokemon({required this.name, required this.url, required this.pokedexNumber, required this.displayPokedexNum});

  factory Pokemon.fromJson(Map<String, dynamic> json, int index) {
    //Just as an FYI. I hate this as much as you, but the API gives me no information other than the name O.o
    int actualIndex = index + 1;
    String name = (json['name'] as String).capitalize();

    String pokedexDisplayNumber = "";
    if (actualIndex < 10) {
      pokedexDisplayNumber = "#00$actualIndex";
    } else if (actualIndex < 100) {
      pokedexDisplayNumber = "#0$actualIndex";
    } else {
      pokedexDisplayNumber = "#$actualIndex";
    }


    return Pokemon(name: name, url: json['url'] ??= "",
        pokedexNumber: actualIndex,
        displayPokedexNum: pokedexDisplayNumber);
  }

  @override
  String toString() {
    return "Name: $name url: $url pokedex no: $pokedexNumber";
  }
}

class GenerationEnums {
  static const String GEN_I = "Generation I - Kanto";
  static const String GEN_II = "Generation II - Johto";
  static const String GEN_III = "Generation III - Hoenn";
  static const String GEN_IV = "Generation IV - Sinnoh";
  static const String GEN_V = "Generation V - Unova";
  static const String GEN_VI = "Generation VI - Kalos";
  static const String GEN_VII = "Generation VII - Alola";
  static const String GEN_VIII = "Generation VIII - Galar";
}

