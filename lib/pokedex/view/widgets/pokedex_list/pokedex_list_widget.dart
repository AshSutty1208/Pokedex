import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/view/widgets/pokedex_list/pokedex_list_scroller_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../consts/app_consts.dart';
import '../../screens/pokedex_detail_screen.dart';
import '../animation_widgets/fade_in.dart';

class PokedexListWidget extends StatefulWidget {
  final List<Pokemon> _pokemonList;

  const PokedexListWidget(this._pokemonList);

  @override
  _PokedexListWidgetState createState() => _PokedexListWidgetState();
}

class _PokedexListWidgetState extends State<PokedexListWidget> {
  final AutoScrollController _controller = AutoScrollController();
  bool isVisible = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPokemonListItem(Pokemon pokemon) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Material(
          elevation: 4,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColours.background,
              border: Border.all(
                  color: AppColours.secondary,
                  width: 1,
                  strokeAlign: StrokeAlign.outside),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 42),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppConsts.pokemonImageUrl}${pokemon.pokedexNumber}.png",
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: SpinKitWave(
                          color: AppColours.secondary,
                          size: 24,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        color: AppColours.secondary,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                          child: DecoratedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 4),
                              child: Text(
                                pokemon.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: const BoxDecoration(
                                color: AppColours.bodyBackground),
                          ),
                        ),
                        DecoratedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, bottom: 4, top: 2),
                            child: Text(
                              pokemon.displayPokedexNum,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColours.bodySubtitle,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              color: AppColours.bodyBackground),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: GestureDetector(
            onHorizontalDragEnd: (dragEndDetails) {
              setState(() {
                if (!isVisible) {
                  isVisible = true;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: NotificationListener(
                child: CustomScrollView(
                  controller: _controller,
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 120,
                              childAspectRatio: 1,
                              crossAxisCount: 3),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return AutoScrollTag(
                            key: ValueKey(index),
                            highlightColor: Colors.black,
                            controller: _controller,
                            index: index,
                            child: _buildPokemonListItem(
                                widget._pokemonList[index]),
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
          ),
        ),
        Visibility(
          visible: isVisible,
          child: SizedBox(
            width: 50,
            height: MediaQuery.of(context).size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isVisible) {
                          isVisible = false;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColours.secondary,
                    ),
                  ),
                  PokedexListScrollerWidget(_controller),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isVisible) {
                          isVisible = false;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColours.secondary,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
