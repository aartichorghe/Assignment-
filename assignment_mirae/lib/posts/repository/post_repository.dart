import 'package:assignment_mirae/posts/model/post.dart';
import 'package:assignment_mirae/posts/res/api_endpoints.dart';
import 'package:assignment_mirae/posts/res/strings/string_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}

class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(ApiEndPoints.fetchPostApiUrl));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception(StringConstant.errorSomethingWentWrong);
    }
  }
}
