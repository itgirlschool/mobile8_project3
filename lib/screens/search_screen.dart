import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
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
  String _Text = "";
  String _searchText = "";
  String er = ' ';
  final FetchHelper fetchHelper = FetchHelper();
  List<String> images = [];
  String doneReqiest = 'smth';
  bool tapped = false;
  _ChangeText(String text) {
    setState(() {
      _Text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Colors.blue, Colors.purple],
          stops: [0, 1],
        ),
      ),
      child: ListView(
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
                    fetchHelper
                        .fetchSearchImages(request: _searchText)
                        .then((value) {
                      setState(() {
                        images = value;
                        er = images[0];
                        if (images.length > 1) tapped = false;
                      });
                    });
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("Search"))
            ],
          ),
          if (images.length == 1)
            Container(
              padding: EdgeInsets.all(8),
              height: 500,
              alignment: Alignment.center,
              //color: const Color.fromRGBO(171, 125, 231, 0.726),
              child: Column(
                children: [
                  const Text(
                    'Something has gone wrong\n\tPlease try again later',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        tapped = true;
                      });
                    },
                    icon: const Icon(Icons.report_problem),
                    label: const Text('Learn more'),
                  ),
                  if (tapped) Text(er),
                ],
              ),
            )
          else
            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //padding: const EdgeInsets.all(8),
                //shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(images[index]);
                },
              ),
            )
        ],
      ),
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
