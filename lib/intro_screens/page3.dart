import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
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
        ],
      ),
    );
  }
}
