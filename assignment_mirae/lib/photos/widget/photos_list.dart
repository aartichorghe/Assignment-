import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotosList extends StatelessWidget {
  final List<Map<String, dynamic>> photos;

  PhotosList({required this.photos, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return Container(
          padding: const EdgeInsets.all(4),
          child: CachedNetworkImage(
            imageUrl: photo['url'],
            imageBuilder: (context, imageProvider) => Container(
              width: 400.w,
              height: 400.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image size fill
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
    );
  }
}
