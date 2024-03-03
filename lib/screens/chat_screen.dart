import 'package:bubblytalks/components/MsgStream.dart';
import 'package:bubblytalks/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:bubblytalks/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";
  //final _auth = FirebaseAuth.instance;
  late User loggedinuser;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedinuser;
  late String message;
  TextEditingController msgcontroller = TextEditingController();

  void getuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser);
      }
    } catch (e) {
      print(e);
    }
  }

  // void msgstream() async {
  //   await for (var ss in _firestore.collection('messages').snapshots()) {
  //     for (var msgs in ss.docs) {
  //       print(msgs.get('text'));
  //     }
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, WelcomeScreen.id);
                //msgstream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MsgStream(firestore: _firestore, user: loggedinuser),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgcontroller,
                      onChanged: (value) {
                        message = value;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      msgcontroller.clear();
                      _firestore.collection('messages').add({
                        'text': message,
                        'user': loggedinuser.email,
                        'name': loggedinuser.displayName
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
