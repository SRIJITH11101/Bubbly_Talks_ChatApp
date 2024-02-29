import 'package:bubblytalks/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:bubblytalks/screens/welcome_screen.dart';
import 'package:bubblytalks/screens/login_screen.dart';
import 'package:bubblytalks/screens/registration_screen.dart';
import 'package:bubblytalks/screens/chat_screen.dart';

void main() => runApp(BubblyTalks());

class BubblyTalks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
