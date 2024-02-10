import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class ShapePage extends StatefulWidget {
  const ShapePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ShapePage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Shape', [
    Icons.circle_outlined,
    Icons.square_outlined,
    Icons.star_outline,
    Icons.favorite_outline,
    Icons.change_history,
  ]);

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
