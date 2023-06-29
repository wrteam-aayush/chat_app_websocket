import 'package:flutter/material.dart';
import 'package:my_socket_app/screens/GroupChatScreen.dart';
import 'package:my_socket_app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController userName = TextEditingController();
  @override
  void dispose() {
    userName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/chat.gif",
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: userName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your user name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Username"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(userName: userName.text),
                          ),
                        );
                      }
                    },
                    child: const Text("GO TO GROUP CHAT"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
