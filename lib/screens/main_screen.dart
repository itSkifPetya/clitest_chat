import 'package:clitest_chat/screens/start_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.greenAccent,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
            child: Column(
              children: [
                const Text("Добро пожаловать OmagadChat!"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartPage()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                    child: const Text("Приступим!"))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
