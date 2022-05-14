// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:next_game/Auth/SignInUpPage.dart';

import '../Frontend/HomePage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshots){
      //     if(snapshots.hasData){
      //       return const HomePage();
      //     }
      //     else {
      //       return const SignInUpPage();
      //     }
      //   },
      // ),
    );
  }
}
