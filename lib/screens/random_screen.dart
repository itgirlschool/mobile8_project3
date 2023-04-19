import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

   @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {

  final FetchHelper fetchHelper = FetchHelper();
  List<String> images = [];

  @override
  void initState() {
    fetchHelper.fetchImages().then((value) {
      setState(() {
        images = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Gif"),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index){
          return Image.network(images[index]);
        }),
    );
  }
} 