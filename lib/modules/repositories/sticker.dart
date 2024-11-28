import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/instance.dart';
import 'package:image/image.dart' as img;

class Sticker {
  /*
  save sticker info: offset, gradient, size, delete, lock
  update sticker info: same above
  delete sticker: delete
   */

  Future<void> createSticker() async {

  }

  Future<void> updateSticker() async {}

  Future<void> deleteSticker() async {}

}
