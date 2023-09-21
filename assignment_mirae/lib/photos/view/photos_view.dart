import 'package:assignment_mirae/photos/api_service/photos_api_service.dart';
import 'package:assignment_mirae/photos/widget/photos_list.dart';
import 'package:assignment_mirae/posts/res/styles/style_constants.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';

import 'package:toast/toast.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({super.key});

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  List<Map<String, dynamic>> photos = [];
  final receivePort = ReceivePort();

  @override
  void initState() {
    super.initState();
    Isolate.spawn(fetchPhotos, receivePort.sendPort);

    receivePort.listen((data) {
      if (data is Exception) {
        return Toast.show('Error');
      } else {
        setState(() {
          photos = List<Map<String, dynamic>>.from(data);
        });
      }
    });
  }

  @override
  void dispose() {
    receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photos',
          style: styleRegular15W600,
        ),
      ),
      body: PhotosList(photos: photos),
    );
  }
}
