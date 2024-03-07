import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> signInWithCreds(String email, String pass) async {
    try {
      
      UserCredential uc =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      _firestore.collection('users').doc(uc.user!.uid).set({
        'uid': uc.user!.uid,
        'email': email,
        'pass': pass,
      });
      return uc;
    } on FirebaseAuthException catch (e) {
      throw Exception("login + e.code");
    }
  }

  // ignore: non_constant_identifier_names
  Future<UserCredential> signUpWithCreds(String email, String pass) async {
    try {
      print("try signup");
      UserCredential uc = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      await _firestore.collection('users').add({
        'uid': uc.user!.uid,
        'email': email,
        'pass': pass,
      });
      return uc;
    } on FirebaseAuthException catch (e) {
      print("auth error");
      print("Error signing uo: $e");
      throw Exception(e.toString());
    }
  }

  void signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}