import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:lindi_sticker_widget/lindi_sticker_icon.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/models/sticker.dart';
import 'package:mecore/modules/screens/today/widgets/today_screen_body.dart';

class AppbarStickerButton extends StatefulWidget {
  static bool isDeleted = false;
  static ConnectionState pickConnectionState = ConnectionState.none;
  static ConnectionState createConnectionState = ConnectionState.none;
  static ConnectionState deleteConnectionState = ConnectionState.none;
  static LindiController lindiController = LindiController(
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
        onTap: () {
          lindiController.selectedWidget!.delete();
          isDeleted = true;
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
    ],
  );

  AppbarStickerButton({super.key});

  @override
  State<AppbarStickerButton> createState() => _AppbarStickerButtonState();
}

class _AppbarStickerButtonState extends State<AppbarStickerButton> {
  File? imageFile;
  XFile? pickedFile;
  List<Widget> widgets = [];
  int stickerIndex = 0;
  Reference? ref;
  String? imageUrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AppbarStickerButton.lindiController.onPositionChange((index) {
    //   stickerIndex = index;
    //   print(
    //       "widgets size: ${AppbarStickerButton.lindiController.widgets.length}, current index: $index");
    // });
  }
  Future<void> pickImage() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFilesList.add(pickedFile!);
      imageFile = File(pickedFilesList.last.path);
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': imageFile!.path},
      );

      ref = storage.ref().child('stickers').child('/${imageFile.hashCode}.png');
      UploadTask uploadTask =  ref!.putData(await imageFile!.readAsBytes(), metadata);
      final imageUrl = await (await uploadTask).ref.getDownloadURL();
      print('imageUrl:$imageUrl');
      imageUrlList.add(imageUrl);
    }
  }

  Future<void> createSticker() async {
    if (imageUrlList.length != widgets.length) {
      widgets.add(
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(imageUrlList.last),
        ),
      );
    }
    await AppbarStickerButton.lindiController.addAll(widgets);

  }

  Future<void> deleteAll() async {
    // if(widgets.length == 0) return;
    // setState(() {
    //   AppbarStickerButton.isDeleted = true;
    // });
    // print(AppbarStickerButton.isDeleted);
    // if(AppbarStickerButton.isDeleted == true){
    //   print('jh deleted');
    //   pickedFilesList.remove(pickedFile);
    //   imageUrlList.remove(imageUrl);
    //   await widgets.remove(widgets[stickerIndex]);
    //   await AppbarStickerButton.lindiController.addAll(widgets);
    //   await ref!.delete();
    //   setState(() {
    //     AppbarStickerButton.isDeleted = false;
    //   });
    // }
  }

  Future<void> futureBuilder() async {
    FutureBuilder(
      future: pickImage(),
      builder: (context, snapshot) {
        AppbarStickerButton.pickConnectionState = snapshot.connectionState;
        return Text('pickImage');
      },
    );
    FutureBuilder(
      future: createSticker(),
      builder: (context, snapshot) {
        AppbarStickerButton.createConnectionState = snapshot.connectionState;
        return Text('createSticker');
      },
    );
    FutureBuilder(
      future: deleteAll(),
      builder: (context, snapshot) {
        AppbarStickerButton.deleteConnectionState = snapshot.connectionState;
        return Text('deleteAll');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            await pickImage();
            await createSticker();
            await deleteAll();
            //await futureBuilder();
          },
          icon: Icon(CupertinoIcons.lasso),
          iconSize: appbarLength(context) * 0.55,
        ),
      ),
    );
  }
}
