import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/modules/models/lindi.dart';

class LindiCubit extends Cubit<List<Lindi>>{
  LindiCubit():super([]);
  void add({required String url, required int hashCode, required ValueKey key}) {
    List<Lindi> copyWithState = List.from(state);
    copyWithState.add(Lindi(url: url, hashCode: hashCode, key: key));
    emit(copyWithState);
  }

  void delete(ValueKey? key) {
    if (key == null) return ;
    state.removeWhere((element) => element.key == key,);
    emit(List.from(state));
  }
}

