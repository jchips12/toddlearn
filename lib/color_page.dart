import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ColorPage> {
  final String _title = 'Color';
  final List _items = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
    Colors.white,
  ];

  final CarouselController _controller = CarouselController();
  final Random _rand = Random(DateTime.now().millisecondsSinceEpoch);

  int _current = 0;
  List _pool = [];
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    _pool = List.from(_items.sublist(1));
    widgets = _items
        .map(
          (widget) => GestureDetector(
            onTap: () {
              if (_pool.isEmpty) {
                _pool = List.from(_items);
              }
              var item = _pool.removeAt(_rand.nextInt(_pool.length));
              _current = _items.indexOf(item);
              _controller.animateToPage(_current);
            },
            child: Container(
              decoration: BoxDecoration(color: widget),
              width: 300,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CarouselSlider(
              items: widgets,
              carouselController: _controller,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  aspectRatio: 2.0,
                  height: 500.0,
                  padEnds: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) => setState(() => _current = index)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets
                .asMap()
                .entries
                .map((entry) => GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(_current == entry.key ? 0.5 : 0.1),
                      ),
                    )))
                .toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
