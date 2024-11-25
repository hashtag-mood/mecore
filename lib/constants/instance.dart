import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/modules/models/sticker.dart';

final picker = ImagePicker();

FirebaseFirestore db = FirebaseFirestore.instance;

FirebaseStorage storage = FirebaseStorage.instance;