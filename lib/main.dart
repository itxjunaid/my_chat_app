import 'package:flutter/material.dart';
import 'package:myapp/screens/add_contact_screen.dart';
import 'package:myapp/screens/email_verification_screen.dart';
import 'package:myapp/screens/forgot_password_screen.dart';
import 'package:myapp/screens/group_chat_screen.dart';
import 'package:myapp/screens/home_chat_screen.dart';
import 'package:myapp/screens/individual_chat_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/phone_auth_screen.dart';

import 'package:myapp/screens/settings_screen.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
 initialRoute: '/',
      routes: {
 '/' : (context) => SplashScreen(),
 '/welcome': (context) => WelcomeScreen(),
 '/signup': (context) => SignupScreen(),
 '/login': (context) => LoginScreen(),
 '/forgot_password': (context) => ForgotPasswordScreen(),
 '/email_verification': (context) => EmailVerificationScreen(),
 '/phone_authentication': (context) => PhoneAuthenticationScreen(),
 '/home': (context) => HomeChatScreen(),
 '/individual_chat': (context) => IndividualChatScreen(),
 '/group_chat': (context) => GroupChatScreen(),
 '/add_contact': (context) => AddContactScreen(),
 '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
