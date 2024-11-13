import 'package:flutter/material.dart';

class ColorCellsIndex {


  void addIndex() {
    for(int i = 0; i < 48; i++) {
      colorCellsIndexList.add(i);
    }
  }

  void addKey() {
    for (int key in colorCellsIndexList) {
      colorCellsMap[key];
    }
  }
}

Map<int, Color> colorCellsMap = {};
List<int> colorCellsIndexList = [];

List<int> addIndex() {
  for(int i = 0; i < 48; i++) {
    colorCellsIndexList.add(i);
  }
  return colorCellsIndexList;
}

Map<int, Color> addKey() {
  for (int key in addIndex()) {
    colorCellsMap[key];
  }
  return colorCellsMap;
}

Map<int, Color> addValue() {

}