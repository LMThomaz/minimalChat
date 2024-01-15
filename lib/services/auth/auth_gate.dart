import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/pages/home_page.dart';
import 'package:minimal_chat/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user id logged in
        if (snapshot.hasData) {
          return HomePage();
        }
        // user is NOT logged in
        else {
          return const LoginOrRegister();
        }
      },
    );
  }
}
