import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/bloc/setting_cubit.dart';
import 'package:mecore/modules/bloc/user_image_cubit.dart';
import 'package:mecore/modules/models/setting.dart';
import 'package:mecore/modules/models/user_image.dart';
import 'package:mecore/modules/screens/setting/widgets/setting_custom_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, Setting>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: mainBorderSide, bottom: mainBorderSide),
                  ),
                  child: Row(
                    children: [
                      BlocBuilder<UserImageCubit, UserImage>(
                          builder: (context, state) {
                        return Container(
                          width: appbarLength(context) * 2,
                          height: appbarLength(context) * 2,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border(right: mainBorderSide),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            highlightColor: Colors.transparent,
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);
                              context
                                  .read<UserImageCubit>()
                                  .add(pickedFile: pickedFile);
                            },
                            icon: (state.xFile != null)
                                ? SizedBox(
                                    width: appbarLength(context) * 2,
                                    height: appbarLength(context) * 2,
                                    child: Image.network(
                                      state.url,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(CupertinoIcons.photo),
                          ),
                        );
                      }),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: screenWidth(context) - appbarLength(context) * 2,
                            height: appbarLength(context) * 2 * 3 / 5,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border(bottom: mainBorderSide),
                            ),
                            padding: EdgeInsets.only(left: 8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'NAME',
                                style: TextStyle(color: blackColor, fontSize: 22),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: screenWidth(context) - appbarLength(context) * 2,
                            height: appbarLength(context) * 2 * 2 / 5,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                            ),
                            padding: EdgeInsets.only(left: 8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'STATUS',
                                style: TextStyle(color: blackColor, fontSize: 19),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SettingCustomWidget(
                      buttonWidth: appbarLength(context) * 6,
                      buttonHeight: appbarLength(context),
                      border: Border(bottom: mainBorderSide, right: mainBorderSide),
                      child:
                      Align(alignment: Alignment.center, child: Text('00, 30분 텍스트 제거'),),
                    ),
                    SettingCustomWidget(
                      buttonWidth: appbarLength(context),
                      buttonHeight: appbarLength(context),
                      border: Border(bottom: mainBorderSide),
                      child: IconButton(
                        onPressed: () {
                          context.read<SettingCubit>().showMinute();
                        },
                        isSelected: state.showMinute,
                        icon: Text('hide'),
                        selectedIcon: Text('show'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SettingCustomWidget(
                      buttonWidth: appbarLength(context) * 6,
                      buttonHeight: appbarLength(context),
                      border: Border(bottom: mainBorderSide, right: mainBorderSide),
                      child:
                          Align(alignment: Alignment.center, child: Text('24시간'),),
                    ),
                    SettingCustomWidget(
                      buttonWidth: appbarLength(context),
                      buttonHeight: appbarLength(context),
                      border: Border(bottom: mainBorderSide),
                      child: IconButton(
                        onPressed: () {
                          context.read<SettingCubit>().is24Hour();
                        },
                        isSelected: state.is24Hour,
                        icon: Text('12'),
                        selectedIcon: Text('24'),
                      ),
                    ),
                  ],
                ),
                SettingCustomWidget(
                  buttonWidth: screenWidth(context),
                  buttonHeight: appbarLength(context),
                  border: null,
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        context.go('/onboarding');
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'SIGN OUT',
                      style: TextStyle(
                          color: textDarkRedColor,
                          //fontFamily: 'Interop Medium',
                          fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
