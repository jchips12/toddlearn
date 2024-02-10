import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class ShapePage extends StatefulWidget {
  const ShapePage({super.key});

  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<ShapePage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Shape', [
    [FontAwesomeIcons.solidHeart, 0],
    [FontAwesomeIcons.solidSquare, 0],
    [FontAwesomeIcons.play, 3],
    [FontAwesomeIcons.diamond, 0],
    [FontAwesomeIcons.solidCircle, 0],
    [FontAwesomeIcons.solidStar, 0],
  ]);

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
