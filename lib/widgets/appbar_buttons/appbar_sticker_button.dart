import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/models/lindi.dart';
import 'package:mecore/modules/bloc/lindi_cubit.dart';

class AppbarStickerButton extends StatelessWidget {
  final picker = ImagePicker();

  AppbarStickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LindiCubit, List<Lindi>>(builder: (context, state) {
      return Expanded(
        flex: 1,
        child: Container(
          height: appbarLength(context),
          decoration: BoxDecoration(
            border: Border(right: mainBorderSide),
          ),
          child: IconButton(
            highlightColor: Colors.transparent,
            alignment: Alignment.center,
            onPressed: () async {
              XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
              context.read<LindiCubit>().add(pickedFile: pickedFile);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     duration: Duration(milliseconds: 500),
              //     clipBehavior: Clip.hardEdge,
              //     backgroundColor: backgroundColor,
              //     shape: Border(top: mainBorderSide),
              //     content: SizedBox(
              //       height: appbarLength(context) * 2 / 3,
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: Text(
              //           'COMING SOON',
              //           style: TextStyle(
              //               color: blackColor,
              //               fontSize: 20,
              //               fontFamily: 'Unbounded SemiBold'),
              //         ),
              //       ),
              //     ),
              //   ),
            },
            icon: Icon(CupertinoIcons.lasso),
            iconSize: appbarLength(context) * 0.55,
          ),
        ),
      );
    });
  }
}
