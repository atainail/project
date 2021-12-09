import 'package:new_hydrate/login.dart';
import 'package:new_hydrate/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDriver extends StatelessWidget {
  AppDriver({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return _auth.currentUser == null ? const login() : login();
  }
}