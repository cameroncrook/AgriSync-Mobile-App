import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api.dart';

Future<List<Map<String, dynamic>>> getActiveTasks() async {
  final response = await http.get(Uri.parse('${taskPrefix}/test'));

  if (response.statusCode == 200) {
    // Decode the JSON string
    var decodedList = jsonDecode(response.body);

    // Ensure the decoded JSON is a list
    if (decodedList is List) {
      // Map each element in the list to a Map<String, dynamic> and return the list
      return decodedList.map<Map<String, dynamic>>((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Decoded data is not a list');
    }
  } else {
    throw Exception('Failed to load data');
  }
}
