import 'package:flutter/material.dart';
import 'package:yukiproject/index/index.dart';
import 'package:yukiproject/login/login.dart';
import 'package:yukiproject/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authservice().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoginScreen();
        } else if (snapshot.hasError) {
          //error messgae
          return const LoginScreen();
        } else if (snapshot.hasData) {
          return const IndexScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
