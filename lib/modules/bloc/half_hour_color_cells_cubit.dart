import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsCubit extends Cubit<HalfHourColorCells> {
  HalfHourColorCellsCubit():super(HalfHourColorCells(morningColor: backgroundColor, afternoonColor: backgroundColor, eveningColor: backgroundColor, nightColor: backgroundColor));

  void selectMorningColor({required Color color}) {
    emit(HalfHourColorCells(morningColor: color, afternoonColor: state.afternoonColor, eveningColor: state.eveningColor, nightColor: state.nightColor));
  }

  void selectAfternoonColor({required Color color}) {
    emit(HalfHourColorCells(morningColor: state.morningColor, afternoonColor: color, eveningColor: state.eveningColor, nightColor: state.nightColor));
  }

  void selectEveningColor({required Color color}) {
    emit(HalfHourColorCells(morningColor: state.morningColor, afternoonColor: state.afternoonColor, eveningColor: color, nightColor: state.nightColor));
  }

  void selectNightColor({required Color color}) {
    emit(HalfHourColorCells(morningColor: state.morningColor, afternoonColor: state.afternoonColor, eveningColor: state.eveningColor, nightColor: color));
  }
}
