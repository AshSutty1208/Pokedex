import '../extensions/string_extension.dart';

/// Class that represents a Pokemon for a list
class Pokemon {
  static const int genOneAmount = 151;
  static const int genTwoAmount = genOneAmount + 100;
  static const int genThreeAmount = genTwoAmount + 135;
  static const int genFourAmount = genThreeAmount + 108;
  static const int genFiveAmount = genFourAmount + 155;
  static const int genSixAmount = genFiveAmount + 72;
  static const int genSevenAmount = genSixAmount + 88;
  static const int genEightAmount = genSevenAmount + 96;

  final String name;
  final String url;
  final String? generation;
  final int pokedexNumber;
  final String displayPokedexNum;

  Pokemon({required this.name, required this.url, this.generation, required this.pokedexNumber, required this.displayPokedexNum});

  factory Pokemon.fromJson(Map<String, dynamic> json, int index) {
    //Just as an FYI. I hate this as much as you, but the API gives me no information other than the name O.o
    int actualIndex = index + 1;
    String generation = "";
    if (actualIndex <= genOneAmount) {
      generation = GenerationEnums.GEN_I;
    } else if (actualIndex > genOneAmount && actualIndex <= genTwoAmount) {
      generation =  GenerationEnums.GEN_II;
    } else if (actualIndex > genTwoAmount && actualIndex <= genThreeAmount) {
      generation =  GenerationEnums.GEN_III;
    } else if (actualIndex > genThreeAmount && actualIndex <= genFourAmount) {
      generation =  GenerationEnums.GEN_IV;
    } else if (actualIndex > genFourAmount && actualIndex <= genFiveAmount) {
      generation =  GenerationEnums.GEN_V;
    } else if (actualIndex > genFiveAmount && actualIndex <= genSixAmount) {
      generation =  GenerationEnums.GEN_VI;
    } else if (actualIndex > genSixAmount && actualIndex <= genSevenAmount) {
      generation =  GenerationEnums.GEN_VII;
    } else if (actualIndex > genSevenAmount && actualIndex <= genEightAmount) {
      generation =  GenerationEnums.GEN_VIII;
    }

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
        generation: generation,
        pokedexNumber: actualIndex,
        displayPokedexNum: pokedexDisplayNumber);
  }

  @override
  String toString() {
    return "Name: $name url: $url generation: $generation pokedex no: $pokedexNumber";
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

