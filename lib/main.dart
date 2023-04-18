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
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              _buildSearchButton()
            ],
          )
        ),
      ),
    );
  }
}
Widget _buildSearchButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(65, 10, 65, 10),
      child: ElevatedButton(
          onPressed: _refreshImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.refresh),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Мне повезет!"),
              ),
            ],
          )),
    );
  }

  void _refreshImage(){
    setState(() {});
  }
  
  void setState(Null Function() param0) {
  }
