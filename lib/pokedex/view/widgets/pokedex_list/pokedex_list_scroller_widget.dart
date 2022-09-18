import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../consts/app_consts.dart';
import '../../../consts/app_design_constants/app_colours.dart';
import '../animation_widgets/fade_in.dart';

class PokedexListScrollerWidget extends StatefulWidget {
  final AutoScrollController _controller;

  const PokedexListScrollerWidget(this._controller);

  @override
  _PokedexListScrollerWidgetState createState() => _PokedexListScrollerWidgetState();
}

class _PokedexListScrollerWidgetState extends State<PokedexListScrollerWidget> {

  Widget _getAutoScrollButton(String text, int scrollableIndex) {
    return FadeIn (
      fadeInDuration: 500,
      child: GestureDetector(
        onTap: () {
          widget._controller.scrollToIndex(scrollableIndex, duration: const Duration(milliseconds: 500), preferPosition: AutoScrollPosition.begin);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            height: 36,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black.withAlpha(160),
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 4, right: 4),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColours.bodyBackground,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Go To Gen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  _getAutoScrollButton("I", 0),
                  _getAutoScrollButton("II", AppConsts.genOneAmount),
                  _getAutoScrollButton("III", AppConsts.genTwoAmount),
                  _getAutoScrollButton("IV", AppConsts.genThreeAmount),
                  _getAutoScrollButton("V", AppConsts.genFourAmount),
                  _getAutoScrollButton("VI", AppConsts.genFiveAmount),
                  _getAutoScrollButton("VII", AppConsts.genSixAmount),
                  _getAutoScrollButton("VIII", AppConsts.genSevenAmount),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}