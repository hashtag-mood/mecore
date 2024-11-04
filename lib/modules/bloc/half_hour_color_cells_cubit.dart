import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';

class HalfHourColorCellsCubit extends Cubit<HalfHourColorCells> {
  HalfHourColorCellsCubit():super(HalfHourColorCells(selectedColor: backgroundColor, isSelected: false));
}
