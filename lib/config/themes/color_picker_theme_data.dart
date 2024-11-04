import 'package:flutter/material.dart';

Map<String, Color> whiteColors = {
  'white': Color(0xffFFFFFF),
  'bright silver': Color(0xffF8F8F8),
  'light silver': Color(0xffF5F5F5),
  'soft silver': Color(0xffF1F1F1),
  'standard silver': Color(0xffEEEEEE),
  'deep silver': Color(0xffE7E7E7),
  'rich silver': Color(0xffE0E0E0),
  'dark silver': Color(0xffDBDBDB),
};

Map<String, Color> vividRedColors = {
  'red': Color(0xffFF3E3E),
  'bright red': Color(0xffFFD2D2),
  'light red': Color(0xffFFC8C8),
  'soft red': Color(0xffFFC0C0),
  'standard red': Color(0xffFFB8B8),
  'deep red': Color(0xffFFB0B0),
  'rich red': Color(0xffFF9696),
  'dark red': Color(0xffFF4949),
};

Map<String, Color> mutedRedColors = {
  'red': Color(0xffC90000),
  'bright red': Color(0xffDC4D4D),
  'light red': Color(0xffD44646),
  'soft red': Color(0xffBA2525),
  'standard red': Color(0xffAF0000),
  'deep red': Color(0xffBD4747),
  'rich red': Color(0xffBA3333),
  'dark red': Color(0xff8E1F1F),
};

Map<String, Color> orangeColors = {
  'orange': Color(0xffFF7B00),
  'bright orange': Color(0xffFFDCB4),
  'light orange': Color(0xffFFD7A9),
  'soft orange': Color(0xffFFCC92),
  'standard orange': Color(0xffFFBA81),
  'deep orange': Color(0xffFF9E54),
  'rich orange': Color(0xffFF9D42),
  'dark orange': Color(0xffFF8A1C),
};

Map<String, Color> yellowColors = {
  'yellow': Color(0xffFFE100),
  'bright yellow': Color(0xffFFF8BF),
  'light yellow': Color(0xffFFF5A7),
  'soft yellow': Color(0xffFFF187),
  'standard yellow': Color(0xffFFEA4D),
  'deep yellow': Color(0xffE1A900),
  'rich yellow': Color(0xffC49300),
  'dark yellow': Color(0xffB48100),
};

Map<String, Color> limeGreenColors = {
  'green': Color(0xffE1FF80),
  'bright green': Color(0xffEBFFBD),
  'light green': Color(0xffDBFF8D),
  'soft green': Color(0xffC6F365),
  'standard green': Color(0xffC5E757),
  'deep green': Color(0xffB7E12C),
  'rich green': Color(0xff88C700),
  'dark green': Color(0xff7BB400),
};

Map<String, Color> deepGreenColors = {
  'green': Color(0xff208922),
  'bright green': Color(0xffBCE0A7),
  'light green': Color(0xffA2CE86),
  'soft green': Color(0xff99D570),
  'standard green': Color(0xff84C25D),
  'deep green': Color(0xff41A601),
  'rich green': Color(0xff3B7B13),
  'dark green': Color(0xff235A00),
};

Map<String, Color> cyanColors = {
  'cyan': Color(0xff7AECC2),
  'bright cyan': Color(0xffCEF6E8),
  'light cyan': Color(0xffCBFFEC),
  'soft cyan': Color(0xffB8FFE5),
  'standard cyan': Color(0xff93F3D0),
  'deep cyan': Color(0xff6BEABB),
  'rich cyan': Color(0xff6DD4AE),
  'dark cyan': Color(0xff40BAAD),
};

Map<String, Color> skyBlueColors = {
  'blue': Color(0xff5BDBFF),
  'bright blue': Color(0xffE4FAFF),
  'light blue': Color(0xffDDF9FF),
  'soft blue': Color(0xffD0F7FF),
  'standard blue': Color(0xffC5F2FB),
  'deep blue': Color(0xffB3EEFA),
  'rich blue': Color(0xff00C8FF),
  'dark blue': Color(0xff00ADF1),
};

Map<String, Color> lightBlueColors = {
  'blue': Color(0xff87C5FF),
  'bright blue': Color(0xffE3F1FF),
  'light blue': Color(0xffD4EAFF),
  'soft blue': Color(0xffCCE6FF),
  'standard blue': Color(0xffA6D4FF),
  'deep blue': Color(0xff89C6FF),
  'rich blue': Color(0xff54ACFF),
  'dark blue': Color(0xff0988FF),
};

Map<String, Color> deepBlueColors = {
  'blue': Color(0xff4988FF),
  'bright blue': Color(0xffC8DBFF),
  'light blue': Color(0xffB0CAFB),
  'soft blue': Color(0xff96B9FA),
  'standard blue': Color(0xff7AA8FD),
  'deep blue': Color(0xff5590FD),
  'rich blue': Color(0xff004FE1),
  'dark blue': Color(0xff001DAC),
};

Map<String, Color> purpleColors = {
  'purple': Color(0xffC78CFF),
  'bright purple': Color(0xffF4ECFF),
  'light purple': Color(0xffEAD7FF),
  'soft purple': Color(0xffDEC2FF),
  'standard purple': Color(0xffD3A3FF),
  'deep purple': Color(0xffB464FF),
  'rich purple': Color(0xffA13EE8),
  'dark purple': Color(0xff7F1ADE),
};

Map<String, Color> pinkColors = {
  'pink': Color(0xffFF5197),
  'bright pink': Color(0xffFFE4EF),
  'light pink': Color(0xffF5D9E4),
  'soft pink': Color(0xffFAD5E4),
  'standard pink': Color(0xffFFBFD8),
  'deep pink': Color(0xffFBA9CA),
  'rich pink': Color(0xffFF97C1),
  'dark pink': Color(0xffFF76AD),
};

List<Map<String, Color>> colorPickerColors = [
  pinkColors,
  whiteColors,
  vividRedColors,
  mutedRedColors,
  orangeColors,
  yellowColors,
  limeGreenColors,
  deepGreenColors,
  cyanColors,
  skyBlueColors,
  lightBlueColors,
  deepBlueColors,
  purpleColors,
];

List<Color> everyColors() {
  List<Color> allColors = [];
  for (Map<String, Color> map in colorPickerColors) {
    allColors.addAll(map.values);
  }
  return allColors;
}