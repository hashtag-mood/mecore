import 'package:mecore/constants/instance.dart';

class UID {
  static Future<void> setDocRef() async {
    await userDocRef.set({
      'uid': null,
      'nickname': null,
      'status': null,
      'userImage': null,
    });
  }
}