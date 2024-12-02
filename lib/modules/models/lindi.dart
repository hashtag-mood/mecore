import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Lindi {
  String url;
  int hashCode;
  ValueKey key;
  XFile? pickedFile;
  bool isDeleted;
  Lindi({required this.url, required this.hashCode, required this.key, required this.pickedFile, this.isDeleted = false});
}