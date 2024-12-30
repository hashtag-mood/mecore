import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mecore/modules/repositories/today.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_journal_date_picker.dart';
import 'package:mecore/widgets/date_pickers/custom_cupertino_today_date_picker.dart';

CustomCupertinoTodayDatePicker cupertinoTodayDatePicker =
CustomCupertinoTodayDatePicker();

CustomCupertinoJournalDatePicker cupertinoJournalDatePicker =
CustomCupertinoJournalDatePicker();

FirebaseFirestore db = FirebaseFirestore.instance;

FirebaseStorage storage = FirebaseStorage.instance;

CollectionReference todayCollection = db.collection('today');

DocumentReference todayDocRef = todayCollection.doc('todayDoc'); // todo userid로 변경해야 됨

CollectionReference userCollection = db.collection('user');

DocumentReference userDocRef = userCollection.doc('userDoc');