import 'package:flutter/material.dart';
import 'package:my_socket_app/screens/LoginScreen.dart';
import 'package:my_socket_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting Aplication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Constants.scaffoldBackgroundColor),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
