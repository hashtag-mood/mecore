import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_journal_date_picker.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_today_date_picker.dart';

CustomCupertinoTodayDatePicker cupertinoTodayDatePicker =
CustomCupertinoTodayDatePicker();

CustomCupertinoJournalDatePicker cupertinoJournalDatePicker =
CustomCupertinoJournalDatePicker();

FirebaseFirestore db = FirebaseFirestore.instance;

FirebaseStorage storage = FirebaseStorage.instance;