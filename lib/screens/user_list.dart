import 'package:clitest_chat/screens/chat_window.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final _ref = FirebaseDatabase.instance.ref('users');
  var _login = 'default user';

  @override
  void initState() {
    super.initState();

    RealtimeDatabase.read(
        userId: '${FirebaseAuth.instance.currentUser!.uid}/login').then((
        value) {
      setState(() {
        if (value is String) {
          _login = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_login),
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: _ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return ListTile(
            title: Text(snapshot.child('login').value.toString()),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatWindow()));
              print('click');
            },
          );
        },


      ),
    );
  }
}

class RealtimeDatabase {
  static Future<Object?> read({required String userId}) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$userId').get();
    if (snapshot.exists) {
      return snapshot.value;
    } else {
      return '';
    }
  }
}
