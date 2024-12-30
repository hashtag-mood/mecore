import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/modules/models/setting.dart';

class SettingCubit extends Cubit<Setting>{
  SettingCubit():super(Setting(is24Hour: false, showMinute: true));

  void is24Hour() {
    emit(state.copyWith(is24Hour: !state.is24Hour));
  }

  void showMinute() {
    emit(state.copyWith(showMinute: !state.showMinute));
  }
}