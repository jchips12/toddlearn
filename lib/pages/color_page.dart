import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ColorPage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Color', [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
    Colors.white,
  ]);

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
