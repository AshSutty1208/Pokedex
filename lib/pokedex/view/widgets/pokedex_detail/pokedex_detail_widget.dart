import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_type.dart';
import 'package:pokedex/pokedex/view/widgets/animation_widgets/fade_in.dart';

import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokedex_detail_list_container.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_detail/pokedex_detail_toolbar_topcontent_widget.dart';

import '../../../consts/app_design_constants/app_colours.dart';

class PokedexDetailWidget extends StatelessWidget {
  final PokemonDetail pokemonDetail;

  PokedexDetailWidget(this.pokemonDetail);

  List<Widget> getPokemonTypeWidgets() {
    List<Widget> widgets = [];

    for (PokemonType pokemonType in pokemonDetail.pokemonTypes) {
      widgets.add(pokemonType.getPokemonTypeTextWidget());
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          expandedHeight: MediaQuery.of(context).padding.top + 330,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: PokedexDetailToolbarTopContentWidget(pokemonDetail),
            titlePadding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            centerTitle: true,
            title: Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                    color: AppColours.primary,
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeIn(
                          fadeInDuration: 1000,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              pokemonDetail.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Container(
                            width: 100,
                            height: 1,
                            color: Colors.white,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getPokemonTypeWidgets()),
                    ],
                  )),
            ),
          ),
        ),
        /// Contained inside of a single item list
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return PokdexDetailListContainerWidget(pokemonDetail);
            },
            childCount: 1,
          ),
        ),
      ]),
    );
  }
}
