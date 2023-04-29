import 'package:flutter/material.dart';
import 'package:mobile8_project3/data/fetch_helper.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});


  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final FetchHelper fetchHelper = FetchHelper();
  
  List<String> _images = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.pink,
              Colors.yellow
            ],
          ),
        ),
      ),
        actions: [_buildSearchButton()],
      ),
      body: 
      ListView.builder(
          itemCount: _images.length,
          itemBuilder: (context, index) => Image.network(_images[index]),
        )
    );
  }

  Widget _buildSearchButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(45, 10, 115, 10),
      child: ElevatedButton(
          onPressed: () async {
            if (isLoading) { return; }
            isLoading = true;
            try {
              final image = await fetchHelper.fetchRandomImage();
              setState(() {
                _images.add(image);
              });
            } catch(e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Something has gone wrong\nPlease try again later")));
            } finally {
              isLoading = false;
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.refresh),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text("Мне повезет!"),
              ),
            ],
          )),
    );
  }
  

} 



