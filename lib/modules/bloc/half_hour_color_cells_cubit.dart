import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsCubit extends Cubit<HalfHourColorCells> {
  HalfHourColorCellsCubit():super(HalfHourColorCells(selectedColor: backgroundColor, isSelected: false));

  void isSwitched() {
    emit(HalfHourColorCells(selectedColor: state.selectedColor, isSelected: !state.isSelected));
  }

  void selectColor({required Color color}) {
    var selected = HalfHourColorCells(selectedColor: color, isSelected: true);
    var unselected = HalfHourColorCells(selectedColor: null, isSelected: false);
    emit((state.isSelected) ? selected : unselected);
  }
}
