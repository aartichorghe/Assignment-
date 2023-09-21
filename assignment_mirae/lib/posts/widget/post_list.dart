import 'package:assignment_mirae/posts/model/post.dart';
import 'package:assignment_mirae/posts/res/styles/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostList extends StatelessWidget {
  final List<Post>? posts;

  PostList({required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    if (posts!.isNotEmpty) {
      return ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            padding: EdgeInsets.symmetric(vertical: 5.h),
            color: Colors.pink[200],
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                posts![index].title!,
                style: styleRegular14W500,
              ),
              subtitle: Text(
                posts![index].body!,
                style: styleRegular12W400,
              ),
            ),
          );
        },
      );
    }
    return Container();
  }
}
