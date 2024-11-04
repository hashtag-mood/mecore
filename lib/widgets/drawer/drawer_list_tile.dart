import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String leading;
  final String title;
  final VoidCallback onTapCallback;
  const DrawerListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 24,
        child: Text(
          leading,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: onTapCallback,
    );
  }
}
