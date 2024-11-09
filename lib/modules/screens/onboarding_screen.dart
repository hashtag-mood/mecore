import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/modules/repositories/twitter_auth.dart';

class OnboardingScreen extends StatefulWidget {
  final String? signUpPath;
  final String? signInPath;
  final String? twitterPath;
  final String? applePath;

  const OnboardingScreen(
      {super.key,
      this.signUpPath,
      this.signInPath,
      this.twitterPath,
      this.applePath});

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
            Container(
              width: appbarLength(context),
              height: appbarLength(context),
              decoration: BoxDecoration(
                border: Border(
                  top: mainBorderSide,
                  bottom: mainBorderSide,
                ),
                color: backgroundColor,
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () async {
                    try {
                      if (kIsWeb) {
                        await signInWithTwitter(context);
                      } else {
                        await signInWithTwitter(context);
                      }
                    } catch(e) {
                      print(e);
                    }
                  },
                  child: Image(
                    image: AssetImage('assets/image/twitter_logo.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
