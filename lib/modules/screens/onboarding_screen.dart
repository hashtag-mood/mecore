import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/modules/repositories/apple_auth.dart';
import 'package:mecore/modules/repositories/facebook_auth.dart';
import 'package:mecore/modules/repositories/google_auth.dart';
import 'package:mecore/modules/repositories/twitter_auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
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
                          try {
                            if (kIsWeb) {
                              await signInWithApple(context);
                            } else {
                              await signInWithApple(context);
                            }
                          } catch (e) {
                            print(e);
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
                        try {
                          if (kIsWeb) {
                            await signInWithGoogle(context);
                          } else {
                            await signInWithGoogle(context);
                          }
                        } catch (e) {
                          print(e);
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
                        try {
                          if (kIsWeb) {
                            await signInWithTwitter(context);
                          } else {
                            await signInWithTwitter(context);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/image/x_logo_512.png'),
                      ),
                    ),
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
                        try {
                          if (kIsWeb) {
                            await signInWithFacebook(context);
                          } else {
                            await signInWithFacebook(context);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/image/facebook_logo_512.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
