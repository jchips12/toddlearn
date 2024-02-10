import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<AnimalPage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Animals', [
    'bunny',
    'cat',
    'cow',
    'dog',
    'deer',
    'duck',
    'elephant',
    'giraffe',
    'horse',
    'lion',
    'llama',
    'monkey',
    'owl',
    'panda',
    'penguin',
    'tiger',
    'zebra',
  ]);

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
