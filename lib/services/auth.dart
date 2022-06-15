import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
}

Future<void> login({required String emailId, required String password}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailId, password: password);
    log('User signed in');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log('No user found for that email');
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user');
    }
  }
}

Future<void> signUp({required String email, required String password}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    log('User Created');
  } on FirebaseAuthException catch (e) {
    log(e.message!);
  }
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    log('Signed out');
  } on FirebaseAuthException catch (e) {
    log(e.message!);
  }
}
