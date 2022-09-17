import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../consts/app_consts.dart';
import '../../screens/pokedex_detail_screen.dart';
import '../animation_widgets/fade_in.dart';

class PokedexListWidget extends StatefulWidget {
  final List<Pokemon> _pokemonList;

  PokedexListWidget(this._pokemonList);

  @override
  _PokedexListWidgetState createState() => _PokedexListWidgetState();
}

class _PokedexListWidgetState extends State<PokedexListWidget> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPokemonListItem(Pokemon pokemon) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            color: AppColours.background,
            border: Border.all(
                color: Colors.redAccent,
                width: 1,
                strokeAlign: StrokeAlign.outside),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                        "${AppConsts.pokemonImageUrl}${pokemon.pokedexNumber}.png",
                        fit: BoxFit.contain, errorBuilder:
                            (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                      return const Icon(
                        Icons.error_outline,
                        color: AppColours.secondary,
                      );
                    }, loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: SpinKitWave(
                          color: AppColours.secondary,
                          size: 32,
                        ),
                      );
                    })),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 4, right: 4, top: 4),
                          child: Text(
                            pokemon.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: AppColours.secondary.withAlpha(180),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, bottom: 4, top: 2),
                          child: Text(
                            pokemon.displayPokedexNum,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withAlpha(200),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: AppColours.secondary.withAlpha(180),
                      ),
                    ]),
              ),
              Material(
                elevation: 4,
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.redAccent[100],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PokedexDetailScreen(pokemon.url)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: NotificationListener(
            child: CustomScrollView(
              controller: _controller,
              slivers: [
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: _controller,
                        index: index,
                        child:
                            _buildPokemonListItem(widget._pokemonList[index]),
                      );
                    },
                    childCount: widget._pokemonList.length,
                  ),
                ),
              ],
            ),
            onNotification: (t) {
              if (t is ScrollStartNotification) {
                FocusManager.instance.primaryFocus?.unfocus();
                return true;
              }
              return true;
            },
          ),
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     constraints:
        //         const BoxConstraints(maxWidth: 48, minHeight: double.infinity),
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 8),
        //       child: FittedBox(
        //         child: Container(
        //           padding: EdgeInsets.only(top: 16, bottom: 16),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.rectangle,
        //             color: Colors.red.withAlpha(220),
        //             border: Border.all(color: Colors.white),
        //             borderRadius: const BorderRadius.all(
        //               Radius.circular(12.0),
        //             ),
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               FadeIn(
        //                 fadeInDuration: 1000,
        //                 child: GestureDetector(
        //                   onTap: () {
        //                     _controller.scrollToIndex(200, duration: Duration(seconds: 1), preferPosition: AutoScrollPosition.begin);
        //                   },
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(vertical: 4),
        //                     child: Container(
        //                       height: 36,
        //                       width: 56,
        //                       decoration: BoxDecoration(
        //                         shape: BoxShape.rectangle,
        //                         color: Colors.black.withAlpha(160),
        //                         border: Border.all(color: Colors.white),
        //                         borderRadius: BorderRadius.all(
        //                           Radius.circular(12.0),
        //                         ),
        //                       ),
        //                       child: Align(
        //                         alignment: Alignment.center,
        //                         child: Text(
        //                           "100",
        //                           style: TextStyle(
        //                               fontSize: 16, color: Colors.white),
        //                           textAlign: TextAlign.center,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               FadeIn(
        //                 fadeInDuration: 1000,
        //                 child: Padding(
        //                   padding: EdgeInsets.symmetric(vertical: 4),
        //                   child: Container(
        //                     height: 36,
        //                     width: 56,
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.rectangle,
        //                       color: AppColours.secondary.withAlpha(80),
        //                       border: Border.all(color: Colors.white),
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(12.0),
        //                       ),
        //                     ),
        //                     child: Align(
        //                       alignment: Alignment.center,
        //                       child: Text(
        //                         "100",
        //                         style: TextStyle(
        //                             fontSize: 16, color: Colors.white),
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               FadeIn(
        //                 fadeInDuration: 1000,
        //                 child: Padding(
        //                   padding: EdgeInsets.symmetric(vertical: 4),
        //                   child: Container(
        //                     height: 36,
        //                     width: 56,
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.rectangle,
        //                       color: AppColours.secondary.withAlpha(80),
        //                       border: Border.all(color: Colors.white),
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(12.0),
        //                       ),
        //                     ),
        //                     child: Align(
        //                       alignment: Alignment.center,
        //                       child: Text(
        //                         "100",
        //                         style: TextStyle(
        //                             fontSize: 16, color: Colors.white),
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               FadeIn(
        //                 fadeInDuration: 1000,
        //                 child: Padding(
        //                   padding: EdgeInsets.symmetric(vertical: 4),
        //                   child: Container(
        //                     height: 36,
        //                     width: 56,
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.rectangle,
        //                       color: AppColours.secondary.withAlpha(80),
        //                       border: Border.all(color: Colors.white),
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(12.0),
        //                       ),
        //                     ),
        //                     child: Align(
        //                       alignment: Alignment.center,
        //                       child: Text(
        //                         "100",
        //                         style: TextStyle(
        //                             fontSize: 16, color: Colors.white),
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               FadeIn(
        //                 fadeInDuration: 1000,
        //                 child: Padding(
        //                   padding: EdgeInsets.symmetric(vertical: 4),
        //                   child: Container(
        //                     height: 36,
        //                     width: 56,
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.rectangle,
        //                       color: AppColours.secondary.withAlpha(80),
        //                       border: Border.all(color: Colors.white),
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(12.0),
        //                       ),
        //                     ),
        //                     child: Align(
        //                       alignment: Alignment.center,
        //                       child: Text(
        //                         "100",
        //                         style: TextStyle(
        //                             fontSize: 16, color: Colors.white),
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
