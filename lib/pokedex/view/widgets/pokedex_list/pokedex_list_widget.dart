import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';
import 'package:pokedex/pokedex/view/widgets/animation_widgets/fade_in.dart';

import '../../../consts/app_consts.dart';
import '../../screens/pokedex_detail_screen.dart';

class PokedexListWidget extends StatefulWidget {
  final List<Pokemon> _pokemonList;

  PokedexListWidget(this._pokemonList);

  @override
  _PokedexListWidgetState createState() => _PokedexListWidgetState();
}

class _PokedexListWidgetState extends State<PokedexListWidget> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPokemonListItem(Pokemon pokemon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Container(
                constraints: BoxConstraints(minHeight: 36, minWidth: 36),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColours.secondary.withAlpha(180)),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                      "${AppConsts.pokemonImageUrl}${pokemon.pokedexNumber}.png",
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return const Icon(
                      Icons.info_sharp,
                      color: Colors.red,
                    );
                  }, loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: SpinKitWave(
                        color: Colors.white,
                        size: 10,
                      ),
                    );
                  }),
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Text(pokemon.pokedexNumber.toString()),
            flex: 1,
          ),
          Expanded(
            child: Text(pokemon.name),
            flex: 8,
          ),
          const Expanded(
            child: Icon(
              Icons.arrow_right,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(child: GroupedListView<dynamic, String>(
      controller: _controller,
      elements: widget._pokemonList,
      groupBy: (pokemon) {
        return (pokemon as Pokemon).generation!;
      },
      order: GroupedListOrder.ASC,
      scrollDirection: Axis.vertical,
      itemComparator: (item1, item2) {
        int pokemon1Name = (item1 as Pokemon).pokedexNumber;
        int pokemon2Name = (item2 as Pokemon).pokedexNumber;
        return pokemon1Name.compareTo(pokemon2Name);
      },
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Container(
        color: AppColours.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemBuilder: (context, pokemon) {
        return FadeIn(fadeInDuration: 1000, child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokedexDetailScreen(pokemon.url)),
                );
              },
              child: _buildPokemonListItem(pokemon),
            )));
      },
    ), onNotification: (t) {
      if (t is ScrollStartNotification) {
        FocusManager.instance.primaryFocus?.unfocus();
        return true;
      }
      return true;
    },);
  }
}
