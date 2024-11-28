import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

Future<void> signInWithApple(BuildContext context) async {
  final appleProvider = AppleAuthProvider();
  UserCredential userCredential;
  try {
    if (kIsWeb) {
      userCredential =
          await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }

    if (userCredential.user != null) {
      context.go('/today');
    }
  } catch (e) {
    print(e);
  }
}
