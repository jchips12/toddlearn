import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toddlearn/animal_page.dart';
import 'package:toddlearn/menu_page.dart';
import 'package:toddlearn/letter_page.dart';
import 'package:toddlearn/number_page.dart';
import 'package:toddlearn/shape_page.dart';

import 'color_page.dart';

void main() {
  runApp(const ToddLearn());
}

class ToddLearn extends StatelessWidget {
  const ToddLearn({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Color & Animals App',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPage(),
        '/letter': (context) => const LetterPage(),
        '/number': (context) => const NumberPage(),
        '/color': (context) => const ColorPage(),
        '/shape': (context) => const ShapePage(),
        '/animal': (context) => const AnimalPage(),
      },
    );
  }
}
