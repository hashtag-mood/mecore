import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/instance.dart';

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
      await userDocRef.update({'uid':userCredential.user!.uid});
      context.go('/today');
    }
  } catch (e) {
    print(e);
  }
}
