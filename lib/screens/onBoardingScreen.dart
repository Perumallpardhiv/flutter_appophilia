import 'package:appophilia/auth/auth.dart';
import 'package:appophilia/intro_screens/page1.dart';
import 'package:appophilia/intro_screens/page2.dart';
import 'package:appophilia/intro_screens/page3.dart';
import 'package:appophilia/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  AuthClass authClass = AuthClass();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkIfLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = value == 2 ? true : false;
              });
            },
            children: [
              page1(),
              page2(),
              page3(),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: TextButton(
                onPressed: () {
                  _controller.animateToPage(
                    2,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "BACK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SwapEffect(
                    dotColor: Colors.deepPurple.shade50,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    onLastPage
                        ? isLogin
                            ? Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()),
                                (route) => false,
                              )
                            : await authClass.googleSignIn(context)
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                  },
                  child: onLastPage
                      ? Row(
                          children: const [
                            Text(
                              "START",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: const [
                            Text(
                              "NEXT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 17,
                            )
                          ],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
