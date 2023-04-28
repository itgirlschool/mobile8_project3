import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile8_project3/data/consts.dart';

class FetchHelper {
  Future<String> fetchRandomImage() async {
    const fullUri = "https://$randomBaseUrl?api_key=$apiKey";
    final uri = Uri.parse(fullUri);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      final String? image = result['data']['images']['original']['url'];
      if (image == null) {
        throw Exception('Failed to load data');
      }
      return image;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<String>> fetchTrendingImages() async {
    const fullUri =
        "https://$trendingBaseUrl?api_key=$apiKey&limit=$trendingLimit";
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

  Future<List<String>> fetchSearchImages({required String request}) async {
    String fullUri =
        "https://$searchBaseUrl?api_key=$apiKey&q=$request&limit=$searchLimit";
    final uri = Uri.parse(fullUri);
    try {
      final response = await http.get(uri);
      final result = jsonDecode(response.body);
      final images = (result['data'] as List<dynamic>)
          .map((e) => e['images']['original']['url'] as String)
          .toList();

      return images;
    } catch (error) {
      return [error.toString()];
    }
  }
}
