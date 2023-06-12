import 'package:flutter/material.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  _UserRegisterPage createState() => _UserRegisterPage();
}

class _UserRegisterPage extends State<UserRegisterPage> {
  // For Regex
  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  String? passwordValidation(String? value) {
    // check whether there is a capital letter
    final RegExp regex1 = RegExp('^(?=.*[A-Z])');
    // check whether there is a special charater
    final RegExp regex2 = RegExp(r'^(?=.*[@#$%^&+=!.])');
    // check whether the password's length is bigger than 6
    final RegExp regex3 = RegExp(r'^(?=.{6,})');

    if (value == null || value.isEmpty) {
      _passwordFocusNode.requestFocus();
      return "Please enter password!";
    } else if (!regex1.hasMatch(value)) {
      _passwordFocusNode.requestFocus();
      return "At least 1 capital letter!";
    } else if (!regex2.hasMatch(value)) {
      _passwordFocusNode.requestFocus();
      return "At least 1 special character!";
    } else if (!regex3.hasMatch(value)) {
      _passwordFocusNode.requestFocus();
      return "The length should > 6";
    } else {
      return null;
    }
  }

  // For Form Key
  final _userRegisterFormkey = GlobalKey<FormState>();

  // controller for Forms
  int _usernameCharacterCount = 0;
  int _passwordCharacterCount = 0;

  // FocusNode for Forms
  late FocusNode _emailFocusNode;
  late FocusNode _usernameFocusNode;
  late FocusNode _passwordFocusNode;

  // Init
  @override
  void initState() {
    super.initState();

    // controller part

    // FocusNode part
    _emailFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  // Dispose
  @override
  void dispose() {
    // controller part

    // FocusNode part
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  // Build Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _userRegisterFormkey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: "Enter your Email!",
                        ),
                        focusNode: _emailFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _emailFocusNode.requestFocus();
                            return 'Please enter some text';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            _usernameCharacterCount = value.length;
                          });
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          border: const OutlineInputBorder(),
                          labelText: "Enter your Username!",
                          counterText: "$_usernameCharacterCount/20 Characters",
                        ),
                        maxLength: 20,
                        focusNode: _usernameFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _usernameFocusNode.requestFocus();
                            return "Please enter a username!";
                          } else {
                            return null;
                          }
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            _passwordCharacterCount = value.length;
                          });
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.key),
                          border: const OutlineInputBorder(),
                          labelText: "Enter your Password!",
                          counterText: "$_passwordCharacterCount/20 Characters",
                        ),
                        obscureText: true,
                        maxLength: 20,
                        focusNode: _passwordFocusNode,
                        validator: (value) => passwordValidation(value),
                      )),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (_userRegisterFormkey.currentState!.validate()) {
                          print("Sucessful!");
                        } else {
                          print("Something went wrong!");
                        }
                      },
                      child: const Text("Submit!")),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
