import 'package:appophilia/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
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
    return Container(
      color: Colors.deepPurple[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Favourite Games",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: "font3",
                color: Colors.deepPurple,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Lottie.asset('assets/lottie/13683146.json'),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Start Exploring Fantastic Games and add the liked games to your favourite list",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
              ),
            ),
          ),
          isLogin
              ? Container()
              : GestureDetector(
                  onTap: () async {
                    await authClass.googleSignIn(context);
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    child: Card(
                      elevation: 3,
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Google SignIn',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
