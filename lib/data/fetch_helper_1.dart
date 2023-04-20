import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile8_project3/data/consts_1.dart';

class FetchHelper1 {
  String? request;
  Future<List<String>> fetchImgs() async {
    String fullUri = "https://$searchUrl?api_key=$api&q=$request&limit=$limit";
    final uri = Uri.parse(fullUri);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      final images = (result['data'] as List<dynamic>)
          .map((e) => e['images']['original']['url'] as String)
          .toList();

      return images;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void ChangeRequest(String text) {
    request = text;
  }
}
