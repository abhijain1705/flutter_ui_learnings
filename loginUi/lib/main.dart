import 'package:flutter/material.dart';
import 'package:flutter_ui_components/login_1/constant.dart';
import 'package:flutter_ui_components/login_1/sign_in_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login_1/images/background.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "BAKING LESSONS\n",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "MASTER THE ART OF BAKING",
                        style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal))
                  ]),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: const <Widget>[
                          Text(
                            "START LEARNING",
                            style:  TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
