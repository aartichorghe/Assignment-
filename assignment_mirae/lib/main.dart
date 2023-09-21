import 'package:assignment_mirae/di/di.dart';
import 'package:assignment_mirae/posts/repository/post_repository.dart';
import 'package:assignment_mirae/posts/res/strings/string_constants.dart';
import 'package:assignment_mirae/posts/viewmodel/post_view_model.dart';
import 'package:assignment_mirae/utils/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              PostViewModel(postRepository: locator<PostRepository>()),
        ),
      ],
      child: const Assignment(),
    ),
  );
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstant.appName,
      initialRoute: RouteConstant.postView,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
