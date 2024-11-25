import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';

Future<void> signInWithFacebook(BuildContext context) async {
  try {
    if (kIsWeb) {
      UserCredential userCredential;
      // Create a new provider
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      // Once signed in, return the UserCredential
      userCredential =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
      if (userCredential.user != null) {
        context.go('/today');
      }
    } else {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        context.go('/today');
      }
    }
  } catch (e) {
    print(e);
  }
}
