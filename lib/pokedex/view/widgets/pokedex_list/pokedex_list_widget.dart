import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:pokedex/pokedex/model/pokemon.dart';

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
    return Scrollbar(
        thickness: 10,
        interactive: true,
        isAlwaysShown: true,
        controller: _controller,
        child: GroupedListView<dynamic, String>(
          controller: _controller,
          elements: widget._pokemonList,
          groupBy: (pokemon) {
            return (pokemon as Pokemon).generation!;
          },
          order: GroupedListOrder.ASC,
          scrollDirection: Axis.vertical,
          itemComparator: (item1, item2) {
            int pokemon1Name = (item1 as Pokemon).pokedexNumber!;
            int pokemon2Name = (item2 as Pokemon).pokedexNumber!;
            return pokemon1Name.compareTo(pokemon2Name);
          },
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Container(
            color: Theme.of(context).colorScheme.secondary.withAlpha(40),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          itemBuilder: (context, pokemon) {
            return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PokedexDetailScreen(pokemon.url)),
                    );
                  },
                  child: _buildPokemonListItem(pokemon),
                ));
          },
        ));
  }
}
