import 'package:flutter/material.dart';

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
  _ChangeText(String text) {
    setState(() {
      _Text = text;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              TextField(
                onChanged: _ChangeText,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    _searchText = _Text;
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("Search"))
            ],
          )
        ],
      ),
    );
  }
}
