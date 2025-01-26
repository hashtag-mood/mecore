String dayTimeHourText(int index) {
  List<String> hourTextList = [];
  for(int i = 5; i < 17; i++) {
    hourTextList.add('$i');
  }
  return hourTextList[index];
}

String nightTimeHourText(int index) {
  List<String> hourTextList = [];
  for(int i = 17; i < 29; i++) {
    if (i >= 17 && i <= 24) {
      hourTextList.add('$i');
    } else if (i >= 25) {
      hourTextList.add('${i - 24}');
    }
  }
  return hourTextList[index];
}