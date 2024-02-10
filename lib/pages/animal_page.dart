import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<AnimalPage> {
  final CarouselBuilder _carouselBuilder = CarouselBuilder('Animals', [
    'zebra',
    'tiger',
    'monkey',
    'dog',
    'elephant',
    'cat',
    'panda',
    'llama',
    'deer',
    'duck',
    'cow',
    'bunny',
    'owl',
    'lion',
    'penguin',
    'giraffe',
    'horse',
  ]);

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
