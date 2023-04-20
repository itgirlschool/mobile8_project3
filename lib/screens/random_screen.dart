import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final FetchHelper fetchHelper = FetchHelper();
  late final Future<String> image;
  
  @override
  void initState() {
    image = fetchHelper.fetchImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Gif"),
      ),
      body: FutureBuilder<String>(
        future: image,
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.network(snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      })
    );
  }
} 