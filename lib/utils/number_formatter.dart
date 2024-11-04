import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String number = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String formatter = numberFormat.format(int.parse(number));
    return newValue.copyWith(
      text: formatter,
      selection: TextSelection.collapsed(offset: formatter.length),
    );

  }
}
