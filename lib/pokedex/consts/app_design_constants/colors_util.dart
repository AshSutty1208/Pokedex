import 'dart:ui';

import 'app_colours.dart';

class ColorsUtil {
  static Color getColorForPokemonType(String typeName) {
    switch (typeName.toLowerCase()) {
      case "normal":
        return AppColours.pokemonTypeColorNormal;
      case "fire":
        return AppColours.pokemonTypeColorFire;
      case "water":
        return AppColours.pokemonTypeColorWater;
      case "electric":
        return AppColours.pokemonTypeColorElectric;
      case "grass":
        return AppColours.pokemonTypeColorGrass;
      case "ice":
        return AppColours.pokemonTypeColorIce;
      case "fighting":
        return AppColours.pokemonTypeColorFighting;
      case "poison":
        return AppColours.pokemonTypeColorPoison;
      case "ground":
        return AppColours.pokemonTypeColorGround;
      case "flying":
        return AppColours.pokemonTypeColorFlying;
      case "psychic":
        return AppColours.pokemonTypeColorPsychic;
      case "bug":
        return AppColours.pokemonTypeColorBug;
      case "rock":
        return AppColours.pokemonTypeColorRock;
      case "ghost":
        return AppColours.pokemonTypeColorGhost;
      case "dragon":
        return AppColours.pokemonTypeColorDragon;
      case "dark":
        return AppColours.pokemonTypeColorDark;
      case "steel":
        return AppColours.pokemonTypeColorSteel;
      case "fairy":
        return AppColours.pokemonTypeColorFairy;

      default:
        return AppColours.background;

    }
  }
}