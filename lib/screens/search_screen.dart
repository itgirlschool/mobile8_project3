import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper_1.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String _Text = "";
  String _searchText = "";
  final FetchHelper1 fetchHelper = FetchHelper1();
  List<String> images = [];
  String doneReqiest = 'smth';
  _ChangeText(String text) {
    setState(() {
      _Text = text;
    });
  }

  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: _ChangeText,
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  _searchText = _Text;
                  fetchHelper.ChangeRequest(_searchText);
                  fetchHelper.fetchImgs().then((value) {
                    setState(() {
                      images = value;
                    });
                  });
                },
                icon: const Icon(Icons.search),
                label: const Text("Search"))
          ],
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            //shrinkWrap: true,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //constraints: BoxConstraints.loose(Size(100, 100)),
                child: Image.network(images[index]),
              );
            },
          ),
        )
      ],
    );
  }
}

class SearchResults extends StatelessWidget {
  List<String> imgs = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imgs.length ~/ 2,
      itemBuilder: (BuildContext context, int index) {
        Row(
          children: [
            Image.network(imgs[index]),
            Image.network(imgs[index + 1]),
          ],
        );
      },
    );
  }

  SearchResults.from_list(List<String> imges) {
    imgs = imges;
  }
}
