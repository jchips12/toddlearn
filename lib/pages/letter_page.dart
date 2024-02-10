import 'package:flutter/material.dart';
import 'package:toddlearn/util/carousel_builder.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<LetterPage> {
  final CarouselBuilder _carouselBuilder =
      CarouselBuilder('Letter', List.generate(26, (index) => String.fromCharCode(index + 65)));

  @override
  Widget build(BuildContext context) => _carouselBuilder.buildScaffold();
}
