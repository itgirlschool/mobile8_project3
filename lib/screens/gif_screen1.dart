import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({Key? key}) : super(key: key);

  @override
  State<GifScreen> createState() => _GifScreenState();
}


class _GifScreenState extends State<GifScreen> {
  final FetchHelper fetchHelper = FetchHelper();
  List<String> images = [];
  bool isLoading = false;
  VoidCallback showError = () {};

  Future<void> refresh() async {
    fetchHelper.fetchTrendingImages().then((value) {
      setState(() {
        images = value;
      });
    }).catchError((e){showError();});
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showError = () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something has gone wrong\nPlease try again later")));
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe to refresh"),
      ),
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.blue, Colors.purple],
            stops: [0, 1],
          ),
        ),
          child: LiquidPullToRefresh(
            onRefresh: refresh,
            color: Colors.blue,
            height: 200,
            backgroundColor: Colors.purple[300],
            animSpeedFactor: 2,
            showChildOpacityTransition: true,
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(images[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
