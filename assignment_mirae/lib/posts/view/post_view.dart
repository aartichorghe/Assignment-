import 'package:assignment_mirae/posts/model/post.dart';
import 'package:assignment_mirae/posts/res/strings/string_constants.dart';
import 'package:assignment_mirae/posts/res/styles/style_constants.dart';
import 'package:assignment_mirae/posts/viewmodel/post_view_model.dart';
import 'package:assignment_mirae/posts/widget/post_list.dart';
import 'package:assignment_mirae/utils/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Posts',
          style: styleRegular15W600,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushNamed(context, RouteConstant.photosView);
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Post>>(
        stream: postViewModel.getPostsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error Occurred: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(StringConstant.emptyDataMsg),
            );
          } else {
            final posts = snapshot.data;
            return PostList(posts: posts);
          }
        },
      ),
    );
  }
}
