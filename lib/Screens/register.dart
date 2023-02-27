// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  bool? _value = false;
  late AnimationController controller;
  late String name;
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
                  Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('assets/images/1.png'),
                      height: 135,
                      width: 140,
                    ),
                  ),
                  Text(
                    'Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
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
                    height: 15,
                  ),
                  //enter email container
                  TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 12),
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
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        Navigator.pushNamed(context, '/home');
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      // padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: Color(0xFffFBE30),
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    child: Text(
                      'Create account',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account?'),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
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
