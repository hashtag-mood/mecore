import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/modules/models/user_image.dart';

class UserImageCubit extends Cubit<UserImage>{
  UserImageCubit():super(UserImage(xFile: null, url: ''));

  Future<void> add({required XFile? pickedFile}) async {
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      int hashCode = imageFile.hashCode;
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': imageFile.path},
      );
      Reference ref = storage
          .ref()
          .child('user')
          .child('/${hashCode}.png'); //todo: user별로 폴더 만들어서 올리기
      UploadTask uploadTask =
      ref.putData(await imageFile.readAsBytes(), metadata);
      String url = await (await uploadTask).ref.getDownloadURL();
      emit(UserImage(xFile: pickedFile, url: url));
    }
  }
}