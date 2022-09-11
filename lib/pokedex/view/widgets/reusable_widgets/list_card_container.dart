import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/view/widgets/animation_widgets/fade_in.dart';

class ListCardContainer extends StatelessWidget {
  final Widget child;

  const ListCardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        fadeInDuration: 1000,
        child: Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Card(
            color: AppColours.cardBackground,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Padding(padding: const EdgeInsets.all(16), child: child),
          ),
        ),
    );
  }
}
