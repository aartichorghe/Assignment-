import 'package:assignment_mirae/posts/model/post.dart';
import 'package:assignment_mirae/posts/repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;

  PostViewModel({required this.postRepository});

  Stream<List<Post>> getPostsData() async* {
    try {
      final post = await postRepository.fetchPosts();
      yield post;
    } catch (e) {
      print(e);
    }
  }
}
