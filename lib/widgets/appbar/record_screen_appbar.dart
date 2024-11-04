import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/date_cubit.dart';
import 'package:mecore/modules/models/date.dart';
import 'package:mecore/widgets/date_pickers/cupertino_month_year_picker.dart';

class RecordScreenAppBar extends StatefulWidget {
  const RecordScreenAppBar({super.key});

  @override
  State<RecordScreenAppBar> createState() => _RecordScreenAppBarState();
}

class _RecordScreenAppBarState extends State<RecordScreenAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border.symmetric(horizontal: mainBorderSide),
      automaticallyImplyLeading: false,
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      flexibleSpace: Row(
        children: [
          Container(
            width: appbarLength(context),
            height: appbarLength(context),
            child: IconButton(
              highlightColor: Colors.transparent,
              alignment: Alignment.center,
              onPressed: () {
                context.pop(true);
              },
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: blackColor,
              ),
              iconSize: appbarLength(context) * 0.55,
            ),
          ),
          BlocBuilder<DateCubit, Date>(builder: (context, state) {
            return SizedBox(
              width: appbarLength(context) * 5,
              height: appbarLength(context),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                onPressed: () async {
                  await CupertinoMonthYearPicker().selectDate(
                    context,
                    (month) {
                      context.read<DateCubit>().updateMonth(month);
                    },
                    (year) {
                      context.read<DateCubit>().updateYear(year);
                    },
                  );
                },
                child: Text(
                  DateFormat('MMM yyyy').format(state.dateTime).toUpperCase(),
                  style: TextStyle(
                    color: blackColor,
                    fontFamily: 'Unbounded SemiBold',
                    fontSize: appbarLength(context) * 0.38,
                  ),
                ),
              ),
            );
          }),
          Container(
            width: appbarLength(context),
            height: appbarLength(context),
            child: IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: Align(
                alignment: Alignment.center,
                child: Icon(
                  CupertinoIcons.trash,
                  color: blackColor,
                ),
              ),
              iconSize: appbarLength(context) * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
