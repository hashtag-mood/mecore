import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsCubit extends Cubit<HalfHourColorCells> {
  HalfHourColorCellsCubit():super(HalfHourColorCells(selectedColor: null, isColorSelected: false));

  void isSwitched() {
    emit(HalfHourColorCells(selectedColor: state.selectedColor, isColorSelected: !state.isColorSelected));
  }

  void selectColor({required Color color}) {
    var selected = HalfHourColorCells(selectedColor: color, isColorSelected: true);
    var unselected = HalfHourColorCells(selectedColor: null, isColorSelected: false);
    emit((state.isColorSelected) ? selected : unselected);
  }
}
