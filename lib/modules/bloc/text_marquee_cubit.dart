import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/modules/models/text_marquee_model.dart';

class TextMarqueeCubit extends Cubit<TextMarqueeModel> {
  TextMarqueeCubit():super(TextMarqueeModel(textEditingController: TextEditingController(), placeholderText: 'MUSIC, HEADLINE, QUOTE, MEMO, etc.', controllerText: '', completeText: ''));

  void updateText({required String completeText}) {
    emit(TextMarqueeModel(textEditingController: state.textEditingController, placeholderText: state.placeholderText, controllerText: state.controllerText, completeText: completeText));
  }
  
  void updateControllerText({required String controllerText}) {
    emit(TextMarqueeModel(textEditingController: state.textEditingController, placeholderText: state.placeholderText, controllerText: controllerText, completeText: state.completeText));
  }
}
