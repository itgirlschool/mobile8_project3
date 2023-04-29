import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({Key? key}) : super(key: key);

  @override
  State<GifScreen> createState() => _GifScreenState();
}

Future<void> _handleRefresh() async {
  return await Future.delayed(Duration(seconds: 2));
}

class _GifScreenState extends State<GifScreen> {
  final FetchHelper fetchHelper = FetchHelper();
  List<String> images = [];
  bool isLoading = false;
  VoidCallback showError = () {};

  Future refresh() async {
    setState(() => images.clear());
  }

  @override
  void initState() {
    fetchHelper.fetchTrendingImages().then((value) {
      setState(() {
        images = value;
      });
    }).catchError((e){showError();});
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
        child: ElevatedButton(
          onPressed: () async {
            if (isLoading) {
              return;
            }
            isLoading = true;
            try {
              final image = await fetchHelper.fetchTrendingImages();
              setState(() {});
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Something has gone wrong\nPlease try again later")));
            } finally {
              isLoading = false;
            }
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Colors.blue,
                Colors.green,
                Colors.pink,
                Colors.indigo,
              ],
            )),
            child: LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              color: Colors.blue,
              height: 200,
              backgroundColor: Colors.pink[300],
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
      ),
    );
  }
}
