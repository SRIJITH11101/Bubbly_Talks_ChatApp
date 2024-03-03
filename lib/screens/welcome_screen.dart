import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bubblytalks/components/buttonwidget.dart';
import 'package:bubblytalks/screens/login_screen.dart';
import 'package:bubblytalks/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  static const colors = [
    Colors.blueGrey,
    Colors.lightBlueAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.orangeAccent
  ];

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'l1',
                  child: Container(
                    child: Image.asset('images/logo1.png'),
                    height: 65,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'BubblyTalks',
                      textStyle: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.w900),
                      colors: colors,
                    )
                  ],
                  isRepeatingAnimation: true,
                  pause: Duration(milliseconds: 500),
                  //totalRepeatCount: 15,
                  repeatForever: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonWidget(
                btname: 'Log in',
                colour: Colors.lightBlueAccent,
                onpressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            ButtonWidget(
                btname: 'Register',
                colour: Colors.blueAccent,
                onpressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
