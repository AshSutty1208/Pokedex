import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/view_model/pokedex_list_view_model.dart';
import 'package:provider/provider.dart';

class PokedexListSearchWidget extends StatefulWidget {

  _PokedexListSearchWidgetState createState() =>
      _PokedexListSearchWidgetState();
}

class _PokedexListSearchWidgetState extends State<PokedexListSearchWidget> {
  late TextEditingController _inputController;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: AppColours.secondary,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TextFormField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  controller: _inputController,
                  onChanged: (value) {
                    Provider.of<PokedexListViewModel>(context,
                        listen: false)
                        .filterPokemonListBySearchResults(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        Provider.of<PokedexListViewModel>(context,
                            listen: false)
                            .clearPokemonListSearch();
                        setState(() {
                          _inputController.text = "";
                        });

                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white.withAlpha(180)),
                    hintText: 'Enter Pokemon Name/Pokedex Number',
                  )),
            ),
          ),
        ],
      ),
    );
  }
}