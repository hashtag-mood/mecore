import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/bloc/journal_date_cubit.dart';
import 'package:mecore/modules/models/date.dart';

class AppbarJournalDatePickerButton extends StatelessWidget {
  final VoidCallback onPressedCallback;
  const AppbarJournalDatePickerButton({super.key, required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalDateCubit, Date>(
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: Container(
            height: appbarLength(context),
            decoration: BoxDecoration(
              border: Border(right: mainBorderSide),
            ),
            child: TextButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                alignment: Alignment.center,
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
              ),
              onPressed: onPressedCallback,
              child: Text('${state.dateTime.month.toString().padLeft(2, '0')}/${state.dateTime.day.toString().padLeft(2, '0')}/${state.dateTime.year.toString().substring(2)}',
                style: dateTextStyle(context),
              ),
            ),
          ),
        );
      }
    );
  }
}
