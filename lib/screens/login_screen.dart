import 'package:bubblytalks/components/buttonwidget.dart';
import 'package:bubblytalks/constants.dart';
import 'package:bubblytalks/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'l1',
              child: Container(
                height: 250.0,
                child: Image.asset('images/logo1.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: "Enter Your Email")),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: "Enter Your Password")),
            SizedBox(
              height: 24.0,
            ),
            ButtonWidget(
                btname: 'Log in',
                colour: Colors.lightBlueAccent,
                onpressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.white,
                              size: 50.0,
                              secondRingColor: Colors.lightBlueAccent,
                              thirdRingColor: Colors.blueAccent),
                        );
                      });
                  try {
                    final User = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (User != null) {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
