import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ChatWindow extends StatefulWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  State<ChatWindow> createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  final messageContoller = TextEditingController();
  final _ref = FirebaseDatabase.instance.ref('messages');
  final messageName = 'message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
      ),
        body: Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: _ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                return ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.delete), onPressed: () {
                      _ref.child(snapshot.key!).remove();
                  },
                  ),
                  title: Text(
                    snapshot.child(messageName).value.toString()
                  ),
                );
              },
            ),
          ),
          Flexible(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  controller: messageContoller,
                ),
              ),
              const Spacer(flex: 1,),
              Flexible(
                flex: 1,
                child:
                    ElevatedButton(onPressed: () async {
                      _ref.push().child(messageName).set(messageContoller.text).asStream();
                      messageContoller.clear();
                    }, child: Text('Send')),
              )
            ],
          ))
        ],
      ),
    ));
  }
}
