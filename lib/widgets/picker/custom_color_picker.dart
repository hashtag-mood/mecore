import 'package:flutter/material.dart';

Future<void> showColorPicker(BuildContext context) async {
  final Color pickedColor = await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          children: [
            Text('COLOR PICKER'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      );
    },
  );
}
