String hourText(int index) {
  List<String> hourTextList = [];
  for (int i = 4; i < 28; i++) {
    if (i <= 11) {
      hourTextList.add('${i + 1}');
    } else if (i >= 12 && i <= 23) {
      hourTextList.add('${i - 11}');
    } else if (i >= 24) {
      hourTextList.add('${i - 23}');
    }
  }

  return hourTextList[index];
}