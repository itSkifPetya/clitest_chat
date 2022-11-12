import 'package:flutter/material.dart';

import 'login.dart';
import 'registration.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
              child: const Text("Регистрация"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
              child: const Text("Вход"),
            )
          ],
        ),
      ),)
    );
  }
}
