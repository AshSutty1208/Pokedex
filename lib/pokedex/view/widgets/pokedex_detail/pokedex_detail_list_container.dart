import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_widget.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/pokedex/model/apis/api_response.dart';
import 'package:pokedex/pokedex/model/pokemon.dart';

import '../../../view_model/pokedex_list_view_model.dart';

class PokdexDetailListContainerWidget extends StatelessWidget {
  const PokdexDetailListContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listBodyWidgets = Column(children: [

    ],);

    return listBodyWidgets;
  }
}
