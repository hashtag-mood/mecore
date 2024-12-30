import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mecore/constants/instance.dart';

Future<void> signInWithTwitter(BuildContext context) async {
  TwitterAuthProvider twitterProvider = TwitterAuthProvider();
  UserCredential userCredential;

  try {
    if (kIsWeb) {
      userCredential =
          await FirebaseAuth.instance.signInWithPopup(twitterProvider);
    } else {
      userCredential = await FirebaseAuth.instance.signInWithProvider(twitterProvider);
    }

    if (userCredential.user != null) {
      await userDocRef.update({'uid':userCredential.user!.uid});
      context.go('/today');
    }
  } catch (e) {
    print(e);
  }
}