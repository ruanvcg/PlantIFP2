// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthService extends ChangeNotifier {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? usuario;
//   bool isLaoding = true;

//   AuthService() {
//     _authCheck();
//   }

//   _authCheck() {
//     _auth.authStateChanges().listen((User? user) {
//       usuario = (user == null) ? user : user;
//       isLaoding = false;
//       notifyListeners();
//     });
//   }
// }