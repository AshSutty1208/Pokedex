import 'package:flutter/material.dart';

import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';

class TextStyles {
  static const TextStyle? h1CardBody = TextStyle(
      color: AppColours.cardTextBody,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );

  static const TextStyle? cardTitle = TextStyle(
      color: AppColours.cardTextTitle,
      fontSize: 18,
      fontWeight: FontWeight.bold);
}