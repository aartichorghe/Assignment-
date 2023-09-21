import 'package:assignment_mirae/photos/view/photos_view.dart';
import 'package:assignment_mirae/posts/res/strings/string_constants.dart';
import 'package:assignment_mirae/posts/view/post_view.dart';
import 'package:flutter/material.dart';

class RouteConstant {
  static const String postView = '/';
  static const String photosView = '/PhotosView';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.postView:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const PostView();
          },
        );
      case RouteConstant.photosView:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const PhotosView();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text(StringConstant.errorOnNavigation),
        ),
      );
    });
  }
}
