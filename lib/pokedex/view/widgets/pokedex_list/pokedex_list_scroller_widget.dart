import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../consts/app_design_constants/app_colours.dart';
import '../animation_widgets/fade_in.dart';

class PokedexListScrollerWidget extends StatefulWidget {
  final AutoScrollController _controller;

  const PokedexListScrollerWidget(this._controller);

  @override
  _PokedexListScrollerWidgetState createState() => _PokedexListScrollerWidgetState();
}

class _PokedexListScrollerWidgetState extends State<PokedexListScrollerWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 48, minHeight: double.infinity),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red.withAlpha(220),
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeIn (
                    fadeInDuration: 1000,
                    child: GestureDetector(
                      onTap: () {
                        widget._controller.scrollToIndex(200, duration: const Duration(seconds: 1), preferPosition: AutoScrollPosition.begin);
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
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "100",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeIn(
                    fadeInDuration: 1000,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 36,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColours.secondary.withAlpha(80),
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "100",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeIn(
                    fadeInDuration: 1000,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 36,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColours.secondary.withAlpha(80),
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "100",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeIn(
                    fadeInDuration: 1000,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 36,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColours.secondary.withAlpha(80),
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "100",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeIn(
                    fadeInDuration: 1000,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 36,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColours.secondary.withAlpha(80),
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "100",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}