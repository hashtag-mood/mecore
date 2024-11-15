import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: backgroundColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth(context),
                    height: appbarLength(context),
                    decoration: BoxDecoration(
                        border: Border.symmetric(horizontal: mainBorderSide),
                        color: backgroundColor),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'WHAT IS YOUR NAME?',
                        style: TextStyle(color: blackColor, fontSize: 22),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth(context),
                    height: appbarLength(context) * 2,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border(bottom: mainBorderSide),
                    ),
                    child: CupertinoTextField.borderless(
                      textAlign: TextAlign.center,
                      maxLength: null,
                      style: TextStyle(color: blackColor, fontSize: 50),
                      placeholder: 'NAME',
                      placeholderStyle:
                      TextStyle(color: textSilverColor, fontSize: 50),
                    ),
                  ),
                ],
              ),
              Container(
                width: screenWidth(context),
                height: appbarLength(context) * 1.17,
                decoration: BoxDecoration(
                    color: blackColor
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: backgroundColor, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
