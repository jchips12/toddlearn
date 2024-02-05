import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShapePage extends StatefulWidget {
  const ShapePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ShapePage> {
  final String _title = 'Shape';
  final List _items = List.from([
    Icons.circle_outlined,
    Icons.square_outlined,
    Icons.star_outline,
    Icons.favorite_outline,
    Icons.change_history,
  ]);

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
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              width: 300,
              child: Center(
                  child: Icon(
                widget,
                color: Colors.lightBlueAccent,
                size: 180.0,
              )),
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
          const SizedBox(height: 10),
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
