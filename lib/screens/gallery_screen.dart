import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_camera/functions/data_model.dart';
import 'package:project_camera/functions/functions.dart';
import 'package:project_camera/screens/full_image.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _image = '';
  @override
  Widget build(BuildContext context) {
    getallImage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: imagesNotifier,
          builder:
              (BuildContext ctx, List<ImageModel> imagelist, Widget? child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, index) {
                final data = imagelist[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullImage(
                            data: data,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Image(
                        image: MemoryImage(
                          const Base64Decoder().convert(data.image),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ));
              },
              itemCount: imagelist.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 9, 106, 121),
        onPressed: () {
          camera();
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
    
  }

  camera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    } else {
      final imageTemporary = File(image.path).readAsBytesSync();
      setState(
        () {
          _image = base64Encode(imageTemporary);
        },
        
      );
      final imagesmod = ImageModel(image: _image);
      addImage(imagesmod);
    }
  }
}
