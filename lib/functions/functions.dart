// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:project_camera/functions/data_model.dart';

ValueNotifier<List<ImageModel>> imagesNotifier = ValueNotifier([]);

void addImage(ImageModel value) async {
  final imageDb = await Hive.openBox<ImageModel>('image_db');
  await imageDb.add(value);

  imagesNotifier.value.add(value);
  imagesNotifier.notifyListeners();
}

getallImage() async {
  final imageDb = await Hive.openBox<ImageModel>('image_db');
  imagesNotifier.value.clear();
  imagesNotifier.value.addAll(imageDb.values);
  imagesNotifier.notifyListeners();
}

deleteimage(int id) async {
  final imageDb = await Hive.openBox<ImageModel>('image_db');
  await imageDb.deleteAt(id);
  getallImage();
}
