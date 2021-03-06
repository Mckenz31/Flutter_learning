import 'package:flutter/material.dart';
import 'package:flubase_app/pages/registration_screen.dart';
import 'package:flubase_app/pages/welcome_screen.dart';
import 'package:flubase_app/pages/login_screen.dart';
import 'package:flubase_app/pages/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(FlashChat());

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen()
      },
    );
  }
}
