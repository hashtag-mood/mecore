import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/modules/models/lindi.dart';

class LindiCubit extends Cubit<List<Lindi>> {
  LindiCubit() : super([]);

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
          .child('stickers')
          .child('/${hashCode}.png'); //todo: user별로 폴더 만들어서 올리기
      UploadTask uploadTask =
      ref.putData(await imageFile.readAsBytes(), metadata);
      String url = await (await uploadTask).ref.getDownloadURL();
      ValueKey key = ValueKey(DateTime.now().millisecondsSinceEpoch);
      //UniqueKey key = UniqueKey();
      List<Lindi> copyWithState = List.from(state);
      copyWithState.add(
          Lindi(
              url: url, hashCode: hashCode, key: key, pickedFile: pickedFile));
      emit(copyWithState);
    }
  }

  void delete(ValueKey? key) {
    if (key == null) return;
    for (var lindi in state) {
      if (lindi.key == key) {
        Reference ref = storage
            .ref()
            .child('stickers')
            .child('/${lindi.hashCode}.png');
        ref.delete();
      }
    }
    state.removeWhere(
          (element) => element.key == key,
    );
    emit(List.from(state));
  }

  void isDeleted(ValueKey? key) {
    for (var lindi in state) {
      if (lindi.key == key) {
        lindi.isDeleted = true;
      }
    }
    emit(List.from(state));
  }
}
