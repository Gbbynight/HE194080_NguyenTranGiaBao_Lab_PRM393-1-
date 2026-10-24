import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotoApiService {
  Future<List<Photo>> fetchPhotos() async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/photos'
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Photo.fromJson(e as Map<String, dynamic>)).toList();
      // Tiếp theo sẽ chuyển data thành List<Photo>
    } else {
      throw Exception('Failed to load photos');
    }

    throw UnimplementedError();
  }
}