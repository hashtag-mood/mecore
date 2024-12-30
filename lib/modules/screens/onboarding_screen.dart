import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mecore/config/themes/color_picker_theme_data.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/repositories/auth/apple_auth.dart';
import 'package:mecore/modules/repositories/auth/google_auth.dart';
import 'package:mecore/modules/repositories/auth/twitter_auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/image/logo_wobg_black.png'),
                  width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!Platform.isAndroid && !Platform.isWindows) Container(
                      width: appbarLength(context) * 1.2,
                      height: appbarLength(context) * 1.2,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: backgroundColor,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                if (kIsWeb) {
                                  await signInWithApple(context);
                                } else {
                                  await signInWithApple(context);
                                }
                              } catch (e) {
                                print(e);
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: Image(image: AssetImage('assets/image/apple_logo_512.png'),),),
                      ),
                    ),
                    Container(
                      width: appbarLength(context) * 1.2,
                      height: appbarLength(context) * 1.2,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: backgroundColor,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            overlayColor:
                            WidgetStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              if (kIsWeb) {
                                await signInWithGoogle(context);
                              } else {
                                await signInWithGoogle(context);
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Image(image: AssetImage('assets/image/google_logo_512.png'),),),
                      ),
                    ),
                    Container(
                      width: appbarLength(context) * 1.2,
                      height: appbarLength(context) * 1.2,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: backgroundColor,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              if (kIsWeb) {
                                await signInWithTwitter(context);
                              } else {
                                await signInWithTwitter(context);
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Image(
                            image: AssetImage('assets/image/x_logo_512.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isLoading == true) customCupertinoIndicator(context),
          ],
        ),
      ),
    );
  }
}
