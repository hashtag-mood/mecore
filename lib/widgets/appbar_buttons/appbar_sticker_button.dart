import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/models/lindi.dart';
import 'package:mecore/modules/models/lindi_cubit.dart';
import 'package:mecore/modules/repositories/sticker.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

class AppbarStickerButton extends StatefulWidget {
  LindiController lindiController;
  AppbarStickerButton({super.key, required this.lindiController});

  @override
  State<AppbarStickerButton> createState() => _AppbarStickerButtonState();
}

class _AppbarStickerButtonState extends State<AppbarStickerButton> {
  final picker = ImagePicker();

  void _pickImage() async {
    File? imageFile;
    XFile? pickedFile;
    String? imageUrl;

    //todo : imageupload 기능은 cubit 으로 옮기자.

    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': imageFile.path},
      );
      Reference ref =
      storage.ref().child('stickers').child('/${imageFile.hashCode}.png');
      UploadTask uploadTask =
      ref.putData(await imageFile.readAsBytes(), metadata);
      imageUrl = await (await uploadTask).ref.getDownloadURL();

      ValueKey stickerWidgetKey=ValueKey(context.read<LindiCubit>().state.length);
      context.read<LindiCubit>().add(url: imageUrl, hashCode: imageFile.hashCode, key:stickerWidgetKey );

    }
  }


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
              _pickImage();
              },
            icon: Icon(CupertinoIcons.lasso),
            iconSize: appbarLength(context) * 0.55,
          ),
        ),
      );
    });
  }
}
