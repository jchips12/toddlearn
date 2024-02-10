import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<NumberPage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Number', List.generate(10, (i) => '${i + 1}'));

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
