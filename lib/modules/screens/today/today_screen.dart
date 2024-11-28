import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/models/lindi_cubit.dart';
import 'package:mecore/widgets/appbar/today_screen_appbar.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

class TodayScreen extends StatefulWidget {
  final String? recordPath;
  final String? editPath;

  const TodayScreen({super.key, this.recordPath, this.editPath});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  late LindiController lindiController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lindiController = LindiController(
      shouldRotate: false,
      insidePadding: 0,
      borderWidth: 1,
      borderColor: blackColor,
      icons: [
        LindiStickerIcon(
          icon: CupertinoIcons.checkmark,
          backgroundColor: blackColor,
          iconColor: backgroundColor,
          alignment: Alignment.topRight,
          onTap: () {
            lindiController.selectedWidget!.done();
          },
        ),
        LindiStickerIcon(
          icon: CupertinoIcons.xmark,
          backgroundColor: blackColor,
          iconColor: backgroundColor,
          alignment: Alignment.topLeft,
          onTap: () async{
            int? selecetedWidgetKey=(lindiController.selectedWidget?.child.key as ValueKey).value;
            lindiController.selectedWidget!.delete();
            context.read<LindiCubit>().delete(ValueKey(selecetedWidgetKey));
          },
        ),
        LindiStickerIcon(
            icon: CupertinoIcons.layers,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.centerRight,
            onTap: () {
              lindiController.selectedWidget!.stack();
            }),
        LindiStickerIcon(
            icon: Icons.flip,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.bottomLeft,
            onTap: () {
              lindiController.selectedWidget!.flip();
            }),
        LindiStickerIcon(
            icon: CupertinoIcons.crop,
            backgroundColor: blackColor,
            iconColor: backgroundColor,
            alignment: Alignment.bottomRight,
            type: IconType.resize),
      ],);
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            appbarLength(context),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: TodayScreenAppbar(lindiController: lindiController,),
          ),
        ),
        body: TodayScreenBody(lindiController: lindiController,), // TodayScreenBody(),
      ),
    );
  }
}