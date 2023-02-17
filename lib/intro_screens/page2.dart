import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
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
              "Plentiful Genre",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "font2",
                color: Colors.deepPurple,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Multi Genre games useful for inspiring creativity in playing styles by offering a variety of different gameplay mechanics and strategies",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Lottie.asset('assets/lottie/8131809.json'),
          ),
        ],
      ),
    );
  }
}
