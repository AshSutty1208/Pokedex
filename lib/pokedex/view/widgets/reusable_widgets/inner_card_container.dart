import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';

class InnerCardContainer extends StatelessWidget {
  final Widget child;

  const InnerCardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
      const BoxConstraints(minWidth: double.infinity),
      child: Card(
        color: AppColours.secondary,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    );
  }
}
