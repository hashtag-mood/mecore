import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecore/constants/collections.dart';
import 'package:mecore/constants/instance.dart';
import 'package:mecore/modules/bloc/today_date_cubit.dart';
import 'package:mecore/modules/screens/today/widgets/body_header.dart';
import 'package:mecore/modules/screens/today/widgets/music_widget.dart';

class Today {
  // DateTime dateTime = DateTime.now();
  // String music = '';
  // String comment = '';
  // Map<int, Color> morningColors = {};
  // Map<int, Color> afternoonColors = {};
  // Map<int, Color> eveningColors = {};
  // Map<int, Color> nightColors = {};
  // Map<int, String> morningText = {};
  // Map<int, String> afternoonText = {};
  // Map<int, String> eveningText = {};
  // Map<int, String> nightText = {};
  //
  // Today(this.dateTime, this.music, this.comment, this.morningColors, this.afternoonColors, this.eveningColors, this.nightColors, this.morningText, this.afternoonText, this.eveningText, this.nightText);
  /*
  date
  music, comment
  morning, afternoon, evening, night 각각 12개의 textfield, color cell
   */

  static Future<void> setDocRef() async {
    await todayDocRef.set({
      'dateTime' : null,
      'musicText' : null,
      'commentText' : null,
      'morningColors' : null,
      'afternoonColors' : null,
      'eveningColors' : null,
      'nightColors' : null,
      'morningText' : null,
      'afternoonText' : null,
      'eveningText' : null,
      'nightText' : null,
    });
    }

  static Future<void> createMusicText(String musicText) async {
  }

}