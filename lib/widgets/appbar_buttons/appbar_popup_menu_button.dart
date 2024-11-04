import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecore/constants/colors.dart';
import 'package:mecore/constants/lengths.dart';
import 'package:mecore/constants/widgets.dart';

Container popupMenuEmoji(String text, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 10),
    width: appbarLength(context) * 0.5,
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        color: blackColor,
        fontSize: 14,
      ),
    ),
  );
}

Container popupMenuText(String text, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 0),
    width: appbarLength(context) * 1.2,
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        color: blackColor,
        fontSize: 15,
      ),
    ),
  );
}

Divider popupMenuDivider = Divider(color: blackColor, height: 0);

class AppbarPopupMenuButton extends StatefulWidget {
  final VoidCallback onSelectedCallback;

  AppbarPopupMenuButton({super.key, required this.onSelectedCallback});

  @override
  State<AppbarPopupMenuButton> createState() => _AppbarPopupMenuButtonState();
}

class _AppbarPopupMenuButtonState extends State<AppbarPopupMenuButton> {
  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayCloseEntry;

  void _showCustomMenuBox(BuildContext context) {
    final double popupMenuBoxWidth = appbarLength(context) * 2 + 1;

    _overlayEntry?.remove();
    _overlayCloseEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: screenWidth(context) - popupMenuBoxWidth,
        top: MediaQuery.of(context).padding.top + appbarLength(context) - 1,
        width: popupMenuBoxWidth,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border(
                top: mainBorderSide,
                bottom: mainBorderSide,
                left: mainBorderSide),
          ),
          child: Column(
            children: [
              SizedBox(
                height: appbarLength(context) + 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    popupMenuEmoji('🧸', context),
                    popupMenuText('STICKER', context),
                  ],
                ),
              ),
              popupMenuDivider,
              SizedBox(
                height: appbarLength(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    popupMenuEmoji('🚀', context),
                    popupMenuText('SHARE', context),
                  ],
                ),
              ),
              popupMenuDivider,
              SizedBox(
                height: appbarLength(context) - 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    popupMenuEmoji('🫧', context),
                    popupMenuText('RESET', context),
                  ],
                ),
              ),
              // popupMenuDivider,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     popupMenuEmoji('🗑'),
              //     popupMenuText('DELETE'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );

    _overlayCloseEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _removeOverlay();
        },
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    Overlay.of(context).insert(_overlayCloseEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayCloseEntry?.remove();
    _overlayEntry = null;
    _overlayCloseEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: appbarLength(context),
        child: IconButton(
          highlightColor: Colors.transparent,
          alignment: Alignment.center,
          onPressed: () {
            _showCustomMenuBox(context);
          },
          icon: Icon(
            CupertinoIcons.ellipsis_vertical,
            color: blackColor,
          ),
          iconSize: appbarLength(context) * 0.55,
        ),
        // child: PopupMenuButton<PopupMenu>(
        //   constraints: BoxConstraints.tightFor(
        //     width: popupMenuBoxWidth,
        //   ),
        //   offset: Offset(0, appbarLength(context) - 2),
        //   initialValue: _selectedMenu,
        //   onSelected: (PopupMenu item) {
        //     _selectedMenu = item;
        //     onSelectedCallback();
        //   },
        //   icon: Icon(Icons.more_vert_sharp),
        //   iconSize: appbarLength(context) * 0.6,
        //   itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupMenu>>[
        //     const PopupMenuItem<PopupMenu>(
        //       value: PopupMenu.EDIT,
        //       child: Text('EDIT'),
        //     ),
        //     const PopupMenuItem<PopupMenu>(
        //       value: PopupMenu.SAVE,
        //       child: Text('SAVE'),
        //     ),
        //     const PopupMenuItem<PopupMenu>(
        //       value: PopupMenu.SHARE,
        //       child: Text('SHARE'),
        //     ),
        //     const PopupMenuItem<PopupMenu>(
        //       value: PopupMenu.DELETE,
        //       child: Text('DELETE'),
        //     ),
        //   ],
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.zero,
        //     side: BorderSide(),
        //   ),
        //   color: backgroundColor,
        //   elevation: 0,
        // ),
      ),
    );
  }
}
