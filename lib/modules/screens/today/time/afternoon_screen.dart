import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/half_hour_color_cells_cubit.dart';
import 'package:mecore/modules/bloc/setting_cubit.dart';
import 'package:mecore/modules/models/half_hour_color_cells.dart';
import 'package:mecore/modules/models/setting.dart';
import 'package:mecore/utils/hour_text.dart';

class AfternoonScreen extends StatefulWidget {
  const AfternoonScreen({super.key});

  @override
  State<AfternoonScreen> createState() => _AfternoonScreenState();
}

class _AfternoonScreenState extends State<AfternoonScreen> {
  List<String> afternoon12Hours = ['11', '12', '1', '2', '3', '4'];
  List<String> afternoon24Hours = ['11', '12', '13', '14', '15', '16'];
  int? startIndex;
  int? endIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ],
    );
  }
}
