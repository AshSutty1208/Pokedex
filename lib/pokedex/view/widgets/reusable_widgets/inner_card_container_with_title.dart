import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/app_colours.dart';
import 'package:pokedex/pokedex/consts/app_design_constants/text_styles.dart';
import 'package:pokedex/pokedex/view/widgets/animation_widgets/fade_in.dart';
import 'package:pokedex/pokedex/view/widgets/reusable_widgets/inner_card_container.dart';

class InnerCardContainerWithTitle extends StatelessWidget {
  final Widget child;
  final String titleText;

  const InnerCardContainerWithTitle({Key? key,
    required this.child,
    required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(fadeInDuration: 1500, child: Padding(
      padding: EdgeInsets.only(top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(titleText,
          textAlign: TextAlign.center,
          style: TextStyles.h1CardBody,
        ),
        InnerCardContainer(child: child)
      ],)
    )
    );
  }
}
