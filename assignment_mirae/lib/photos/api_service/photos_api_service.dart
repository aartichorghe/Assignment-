import 'dart:io';
import 'dart:isolate';

import 'package:assignment_mirae/photos/res/api_endpoints.dart';
import 'package:assignment_mirae/posts/res/strings/string_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> fetchData() async {
  try {
    final response = await http.get(Uri.parse(ApiEndPoints.fetchPhotosApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception(StringConstant.errorSomethingWentWrong);
    }
  } on SocketException catch (e) {
    throw Exception('Failed to load $e');
  }
}

void fetchPhotos(SendPort sendPort) async {
  final List<Map<String, dynamic>> photos = await fetchData();
  sendPort.send(photos);
}
