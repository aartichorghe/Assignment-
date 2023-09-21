import 'package:assignment_mirae/posts/repository/post_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerFactory<PostRepository>(() => PostRepositoryImpl());
}
