import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile8_project3/data/consts.dart';

class FetchHelper {
  Future<List<String>> fetchImages( ) async {

    const fullUri = "https://$baseURL?api_key=$apiKey";
    final uri = Uri.parse(fullUri);
     
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }
}