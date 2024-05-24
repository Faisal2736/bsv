import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 80,
              width: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //logintext heading
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Please Login",
                            style: TextStyle(
                                fontFamily: "PlusJakartaSans-Bold",
                                fontSize: 25),
                          ),
                          SizedBox.shrink(),
                          Text(
                            "or register and subscribe",
                            style: TextStyle(
                                fontSize: 14, color: Constants.textColor),
                          )
                        ],
                      ),
                    ),
                    // form
                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontFamily: "PlusJakartaSans-Medium",
                                    fontSize: 14,
                                    color: Constants.formContentColot),
                              ),
                              SizedBox(height: 6.0),
                              TextFormField(
                                initialValue: "demo@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 12,
                                  ),
                                  filled: true,
                                  fillColor: Constants.formContentColot
                                      .withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 12.0),

                              // loginfield
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontFamily: "PlusJakartaSans-Medium",
                                    fontSize: 14,
                                    color: Constants.formContentColot),
                              ),
                              SizedBox(height: 6.0),
                              TextFormField(
                                obscureText: true,
                                initialValue: "12345678",
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.visibility),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0,  horizontal: 12,
                                  ),
                                  filled: true,
                                  fillColor: Constants.formContentColot
                                      .withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),

                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Constants.textColor,
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontFamily: "PlusJakartaSans-Medium",
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Constants.textColor,
                                      fontFamily:
                                          "PlusJakartaSans-MediumItalic",
                                    ),
                                  )
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, right: 4, left: 4, bottom: 2),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Constants.loginButtonColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily:
                                              "PlusJakartaSans-SemiBold"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 35, right: 35),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Not a member yet? "),
                      Text(
                        " Register",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Constants.loginButtonColor,
                            decorationColor: Constants.loginButtonColor),
                      ),
                      Text(" and "),
                      Text(
                        " Subscribe",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Constants.loginButtonColor,
                            decorationColor: Constants.loginButtonColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Show "),
                      Text(
                        "Tutorial",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Constants.loginButtonColor,
                            decorationColor: Constants.loginButtonColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 35, right: 35),
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Copyright Brand Social Value ©2024',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
