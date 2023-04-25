import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile8_project3/data/consts.dart';

class FetchHelper {
  Future<String> fetchImage() async {

    //const fullUri = "https://$baseURL?api_key=$apiKey";
    const fullUri = "https://$baseURL?api_key=rjsoKEzA6c8oyNipTLRQfJJrVBgBJF6G";
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
}