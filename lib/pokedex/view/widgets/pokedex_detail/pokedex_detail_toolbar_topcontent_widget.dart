import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/consts/app_consts.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/model/pokemon_detail.dart';

class PokedexDetailToolbarTopContentWidget extends StatefulWidget {
  final PokemonDetail pokemonDetail;

  PokedexDetailToolbarTopContentWidget(this.pokemonDetail);

  @override
  _PokedexDetailToolbarTopContentWidgetState createState() =>
      _PokedexDetailToolbarTopContentWidgetState();
}

class _PokedexDetailToolbarTopContentWidgetState
    extends State<PokedexDetailToolbarTopContentWidget> {
  bool isShiny = false;
  String pokemonUrl = AppConsts.pokemonImageUrl;
  Color borderColour = Colors.black;

  Widget getImageWidget() {
    if (isShiny) {
      return IconButton(
        onPressed: () {
          setState(() {
            isShiny = false;
            pokemonUrl = AppConsts.pokemonImageUrl;
          });
        },
        icon: const Icon(
          Icons.auto_awesome,
          color: AppColours.shinyColour,
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            isShiny = true;
            pokemonUrl = AppConsts.shinyPokemonImageUrl;
          });
        },
        icon: const Icon(
          Icons.auto_awesome,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
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
                        minHeight: MediaQuery.of(context).padding.top + 130,
                        maxHeight: MediaQuery.of(context).padding.top + 130
                    ),
                    decoration: BoxDecoration(
                      color: AppColours.secondary,
                      border: Border(
                          bottom: BorderSide(color: borderColour, width: 8)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).padding.top + 204,
                        maxHeight: MediaQuery.of(context).padding.top + 204
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(
                          minWidth: 160,
                          minHeight: 160,
                          maxHeight: 160,
                          maxWidth: 160),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColours.background,
                        border: Border.all(color: borderColour, width: 8),
                      ),
                      child: Image.network(
                          "$pokemonUrl${widget.pokemonDetail.id}.png",
                          fit: BoxFit.fill,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(
                              Icons.info_sharp,
                              color: Colors.red,
                            );
                          },
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: SpinKitWave(
                                color: Colors.redAccent,
                                size: 20,
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(
                        right: 16, top: MediaQuery
                        .of(context)
                        .padding
                        .top + 18),
                    child: getImageWidget(),
                  ),
                ]),
              ),
            ])),
      ]);
    });
  }
}