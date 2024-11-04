import 'package:flutter/material.dart';
import 'package:mecore/config/themes/custom_date_picker_theme_data.dart';

CustomMaterialDatePicker customMaterialDatePicker = CustomMaterialDatePicker();

class CustomMaterialDatePicker {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  Future<void> selectDate(
      BuildContext context, VoidCallback selectDateCallback) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'SELECT DATE',
      cancelText: 'CANCEL',
      confirmText: 'SELECT',
      fieldLabelText: 'ENTER DATE',
      fieldHintText: 'MM/DD/YYYY',
      barrierColor: Colors.transparent,
      builder: (context, child) {
        return Theme(
          data: getCustomDatePickerThemeData(),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      selectDateCallback();
    }
  }

  void refreshDate() {
    _selectedDate = DateTime.now();
  }
}
