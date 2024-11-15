import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/config/routes/routes.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/repositories/apple_auth.dart';
import 'package:mecore/modules/repositories/twitter_auth.dart';
import 'package:responsive_notebook_background/responsive_notebook_background.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                            await signInWithTwitter(context);
                          } else {
                            await signInWithTwitter(context);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/image/twitter_logo_512.png'),
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
