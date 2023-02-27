// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('object');
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 120, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo here
                  Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('assets/images/1.png'),
                      height: 135,
                      width: 140,
                    ),
                  ),

                  Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color(0xFffFBE30).withOpacity(controller.value),
                      ),
                    ),
                    Text(
                      ' to the Course App',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ]),

                  SizedBox(
                    height: 10,
                  ),
                  //enter username container
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a username";
                      }
                      return null;
                    },
                    // onSaved: (value) => _username = value,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //enter password container
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Enter Password',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //login button
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != Null) {
                          Navigator.pushNamed(context, '/home');
                        }
                      } catch (e) {
                        // print(e);

                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      padding: EdgeInsets.zero,
                      backgroundColor: Color(0xFffFBE30),
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    child: Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Create account',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
