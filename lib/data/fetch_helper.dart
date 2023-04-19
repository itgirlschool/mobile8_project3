import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchHelper {
  Future<List<String>> fetchImages() async {
    const fullUri =
        "https://api.giphy.com/v1/gifs/search?api_key=Ye9mPR1IWuM6Z5CXCkxxxkTqA0xQYijZ&q=flowers&limit=20&offset=0&rating=g&lang=en";
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
}
