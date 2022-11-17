import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_camera/functions/data_model.dart';
import 'package:project_camera/functions/functions.dart';
import 'package:project_camera/screens/gallery_screen.dart';
 
// ignore: must_be_immutable
class FullImage extends StatelessWidget {
  ImageModel data;
  int index;
  FullImage({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Image(
                  image: MemoryImage(
                    const Base64Decoder().convert(data.image),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const GalleryScreen()),
                  (route) => false);
            },
            backgroundColor: const Color.fromARGB(255, 9, 106, 121),
            child: const Icon(Icons.home),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              alertBox(context, index);
            },
            backgroundColor: const Color.fromARGB(255, 9, 106, 121),
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void alertBox(BuildContext ctx, index) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
            title: const Text(
              'Warning !!!',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            content: const Text(
              'Image will be deleted permanently.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  deleteimage(index);
                  Navigator.pop(ctx);
                  Navigator.pop(ctx);
                },
                child: const Text('Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    )),
              ),
            ]);
      },
    );
  }
}
