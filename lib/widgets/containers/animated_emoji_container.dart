import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';
import 'package:mecore/utils/animated_emoji_picker.dart';

class AnimatedEmojiContainer extends StatefulWidget {
  const AnimatedEmojiContainer({super.key});

  @override
  State<AnimatedEmojiContainer> createState() => _AnimatedEmojiContainerState();
}

class _AnimatedEmojiContainerState extends State<AnimatedEmojiContainer> {
  AnimatedEmoji selectedEmoji = AnimatedEmoji(AnimatedEmojis.peace, size: 60); // TODO the initial value of selectedEmoji should be must equal to defaultEmoji
  AnimatedEmoji defaultEmoji = AnimatedEmoji(AnimatedEmojis.peace, size: 60);

  void _showEmojiKeyboard(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return AlertDialog(
          shape: Border.all(width: 1, color: blackColor),
          backgroundColor: backgroundColor,
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          title: null,
          content: SizedBox(
            width: 175,
            height: 300,
            child: GridView.builder(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemCount: animatedEmojis.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = animatedEmojis[index];
                    });
                  },
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: animatedEmojis[index],
                  ),
                );
              },
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: mainBorderSide,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      border: Border(right: mainBorderSide),
                    ),
                    width: 175,
                    height: appbarLength(context),
                    child: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          selectedEmoji = defaultEmoji;
                        });
                      },
                      child: Text(
                        'RESET',
                        style: TextStyle(fontSize: 20, color: blackColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    height: appbarLength(context),
                    child: CupertinoButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'SELECT',
                        style: TextStyle(fontSize: 20, color: blackColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appbarLength(context) * 2, // appbarLength(context) * 5 / 7 * 2 - 1.3,
      height: appbarLength(context) * 2, // musicContainerHeight(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(right: mainBorderSide),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: () => _showEmojiKeyboard(context),
        child: selectedEmoji,
      ),
    );
  }
}
