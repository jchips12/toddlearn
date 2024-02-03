import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todd Learn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            createElevatedButton(context, 'letter'),
            const SizedBox(height: 30),
            createElevatedButton(context, 'number'),
            const SizedBox(height: 30),
            createElevatedButton(context, 'shape'),
            const SizedBox(height: 30),
            createElevatedButton(context, 'animal'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget createElevatedButton(BuildContext context, String name) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.pushNamed(context, '/$name');
      },
      child: Text(name.toUpperCase()),
    );
  }
}
