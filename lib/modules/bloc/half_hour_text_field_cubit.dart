import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/models/half_hour_text_field.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

class HalfHourTextFieldCubit extends Cubit<HalfHourTextField> {
  HalfHourTextFieldCubit(super.initialState);

  void updateTextFieldHeight(int index, double textFieldHeight) {
    List<double> updatedHeights = List.from(state.textFieldHeightList);
    updatedHeights[index] = textFieldHeight;
    emit(HalfHourTextField(
        textFieldHeightList: updatedHeights,
        linesList: state.linesList,
        additionalLines: state.additionalLines,
        additionalHeight: state.additionalHeight));
  }

  void updateLinesList(int index, int line) {
    List<int> updatedLines = List.from(state.linesList);
    updatedLines[index] = line;
    emit(HalfHourTextField(textFieldHeightList: state.textFieldHeightList, linesList: updatedLines, additionalLines: state.additionalLines, additionalHeight: state.additionalHeight));
  }

  void getAdditionalLines(int index, int line) {
    int additionalLines = 0;
    List<int> updatedLines = state.linesList;
    if (updatedLines.any((e) => e != 1)) {
      additionalLines = updatedLines.map((e) => e - 1).reduce((value, e) => value + e);
    }
    emit(HalfHourTextField(
        textFieldHeightList: state.textFieldHeightList,
        linesList: state.linesList,
        additionalLines: additionalLines,
        additionalHeight: state.additionalHeight));
  }

  void addTextFieldHeight() {
    num additionalHeight = 0;
    if (state.textFieldHeightList
        .any((e) => e != TodayScreenBody.textFieldHeight)) {
      additionalHeight = state.textFieldHeightList
          .where((e) => e != TodayScreenBody.textFieldHeight)
          .map((e) => e - TodayScreenBody.textFieldHeight)
          .reduce((value, e) => value + e);
    }
    emit(HalfHourTextField(
        textFieldHeightList: state.textFieldHeightList,
        linesList: state.linesList,
        additionalLines: state.additionalLines,
        additionalHeight: additionalHeight));
  }
}
