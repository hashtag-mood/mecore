import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/modules/models/date.dart';

class DateCubit extends Cubit<Date>{
  DateCubit():super(Date(dateTime: DateTime.now()));
  
  void updateMonth(int selectedMonth) {
    DateTime updateDate = DateTime(state.dateTime.year, selectedMonth, state.dateTime.day);
    emit(Date(dateTime: updateDate));
  }

  void updateYear(int selectedYear) {
    DateTime updateDate = DateTime(selectedYear, state.dateTime.month, state.dateTime.day);
    emit(Date(dateTime: updateDate));
  }

  void updateDay(int selectedDay) {
    DateTime updateDate = DateTime(state.dateTime.year, state.dateTime.month, selectedDay);
    emit(Date(dateTime: updateDate));
  }

}