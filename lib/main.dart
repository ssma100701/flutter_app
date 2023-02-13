import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';
import '/screens/login_screen.dart';
import '/screens/registration_screen.dart';
import '/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      home: WelcomeScreen(),
      initialRoute: '/registration',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/chat': (context) => ChatScreen()
      },
    );
  }
}
