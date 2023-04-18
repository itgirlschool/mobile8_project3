import 'package:flutter/material.dart';

void main() {
  runApp(GifApp());
}

class GifApp extends StatelessWidget {
  const GifApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomScreen (),
    );
  }
}
class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Мне повезет'),
          onPressed: () {}
          ),
      ),
    );
  }
}