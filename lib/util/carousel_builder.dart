import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarouselBuilder {
  final String title;
  final List _items;

  final CarouselController _controller = CarouselController();
  final Random _random = Random(DateTime.now().millisecondsSinceEpoch);

  late int _current;
  late List _pool;

  CarouselBuilder(this.title, this._items) {
    _current = 0;
    _pool = List.from(_items.sublist(1));
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_buildSlider()],
      ),
    );
  }

  Widget _buildSlider() => CarouselSlider(
        items: _buildWidgets(),
        carouselController: _controller,
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          height: 500.0,
          padEnds: false,
          viewportFraction: 1.0,
        ),
      );

  List<Widget> _buildWidgets() => _items
      .map(
        (widget) => GestureDetector(
          onTap: _onTapWidget,
          child: _widgetContent(widget),
        ),
      )
      .toList();

  void _onTapWidget() {
    if (_pool.isEmpty) {
      _pool = List.from(_items);
    }
    var item = _pool.removeAt(_random.nextInt(_pool.length));
    _current = _items.indexOf(item);
    _controller.animateToPage(_current);
  }

  Widget _widgetContent(widget) {
    switch (title) {
      case 'Animals':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0)),
          ),
          child: Image.asset('assets/image/animal/$widget.jpg'),
        );
      case 'Color':
        return Container(
          decoration: BoxDecoration(
            color: widget,
          ),
          width: 325,
        );
      case 'Letter':
      case 'Number':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0)),
          ),
          width: 325,
          child: Center(
            child: Text(
              widget.toUpperCase(),
              style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 150.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      case 'Shape':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0)),
          ),
          width: 325,
          child: Center(
            child: RotatedBox(
              quarterTurns: widget[1],
              child: FaIcon(
                widget[0],
                color: Colors.lightBlueAccent,
                size: 200.0,
              ),
            ),
          ),
        );
      default:
        return const Text('Unimplemented');
    }
  }
}
