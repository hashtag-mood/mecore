import 'package:flutter_bloc/flutter_bloc.dart';

class WheelChooserCubit extends Cubit<String>{
  WheelChooserCubit():super('MORNING');
  void updateValue({required String value}) {
    emit(value);
  }
}