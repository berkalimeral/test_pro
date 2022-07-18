import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireStoreUtils {
   final String email = 'berkalisimsek@hotmail.com';
   final String password = 'passw123';
   final FirebaseAuth auth = FirebaseAuth.instance;
   final FirebaseFirestore firestore = FirebaseFirestore.instance;

   void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

   void signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

   void signOutUser() async {
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
    }
    await auth.signOut();
  }

   void signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

   void signInWithEmailAndPassword(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void createUserWithEmailAndPassword(
      String email, String password) async {
    var _userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password);
    debugPrint(_userCredential.toString());
    await firestore.collection('users').doc(_userCredential.user!.uid).set({
      'email' : email,
      'password' : password
    });
  }
}