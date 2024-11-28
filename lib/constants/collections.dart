import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Map<int, Color> selectedColors = {};
//List<XFile> pickedFilesList = [];
List<String> imageUrlList = [];
List<int> imageHashList=[];
List<ValueKey> stickerKeyList=[];