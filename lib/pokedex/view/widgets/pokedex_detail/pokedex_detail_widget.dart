import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_consts.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';
import 'package:pokedex/pokedex/model/pokemon_details/pokemon_type.dart';

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
    final topContent = LayoutBuilder(builder: (context, c) {
      final settings = context
          .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
      final deltaExtent = settings!.maxExtent - settings.minExtent;
      final t =
          (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
      final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
      const fadeEnd = 1.0;
      final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

      return Column(children: [
        Flexible(
            child: Stack(fit: StackFit.passthrough, children: [
          Opacity(
              opacity: opacity,
              child: Stack(fit: StackFit.passthrough, children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(left: 10),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: const Border(
                          bottom: BorderSide(color: Colors.black, width: 12)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.2 + 60),
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 136,
                        minHeight: 136,
                        maxHeight: 136,
                        maxWidth: 136),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColours.background,
                      border: Border.all(color: Colors.black, width: 12),
                    ),
                    child: Image.network(
                        "${AppConsts.pokemonImageUrl}${pokemonDetail.id}.png"),
                  ),
                )
              ])),
        ])),
      ]);
    });

    return Scaffold(
        body: NestedScrollView(
      body: Text("Hello Im in the body"),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            expandedHeight: MediaQuery.of(context).size.height * 0.2 + 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: topContent,
              titlePadding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                    color: Colors.redAccent,
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                          pokemonDetail.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 4),
                          child: Container(width: 100, height: 1, color: Colors.white,)
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: getPokemonTypeWidgets()
                        ),
                      ],
                    )),
              ),
            ),
          )
        ];
      },
    ));
  }
}
