import 'package:flutter/material.dart';

class DrawerUserCalendarsSilver extends StatefulWidget {
  final String emoji;
  final String title;

  const DrawerUserCalendarsSilver(
      {super.key, required this.emoji, required this.title});

  @override
  State<DrawerUserCalendarsSilver> createState() =>
      _DrawerUserCalendarsSilverState();
}

class _DrawerUserCalendarsSilverState extends State<DrawerUserCalendarsSilver> {
  bool _isEmojiChecked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEmojiChecked = !_isEmojiChecked;
        });
      },
      child: ListTile(
        leading: _isEmojiChecked
            ? SizedBox(
                width: 24,
                child: Text(
                  widget.emoji,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Color(0xFFC5C5C5), BlendMode.srcIn),
                child: SizedBox(
                  width: 24,
                  child: Text(
                    widget.emoji,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
