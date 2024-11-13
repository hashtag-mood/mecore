import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/modules/models/single_line_text.dart';

class SingleLineTextCubit extends Cubit<SingleLineText> {
  SingleLineTextCubit():super(SingleLineText(textEditingController: TextEditingController(), placeholderText: 'NOTE', controllerText: '', completeText: ''));

  void updateText({required String completeText}) {
    emit(SingleLineText(textEditingController: state.textEditingController, placeholderText: state.placeholderText, controllerText: state.controllerText, completeText: completeText));
  }
  
  void updateControllerText({required String controllerText}) {
    emit(SingleLineText(textEditingController: state.textEditingController, placeholderText: state.placeholderText, controllerText: controllerText, completeText: state.completeText));
  }
}
