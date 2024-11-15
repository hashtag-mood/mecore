import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsCubit extends Cubit<HalfHourColorCells> {
  HalfHourColorCellsCubit():super(HalfHourColorCells(selectedColor: null));

  void selectColor({required Color? color}) {
    emit(HalfHourColorCells(selectedColor: color));
  }
}
