import 'package:appophilia/api_responce/apifetch_id.dart';
import 'package:appophilia/models/game_model_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class gamePage extends StatefulWidget {
  int id;
  gamePage({required this.id});

  @override
  State<gamePage> createState() => _gamePageState();
}

class _gamePageState extends State<gamePage> {
  late GameModelId _gameInfo;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getGameInfo();
  }

  Future<void> getGameInfo() async {
    _gameInfo = await getGameId(widget.id);
    setState(() {
      isLoading = false;
    });
    print(22);
    print(_gameInfo);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.deepPurple.shade50,
            body: const Center(
              child: SpinKitSpinningLines(
                color: Colors.deepPurple,
                size: 50.0,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.deepPurple.shade50,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.deepPurple.shade300,
              title: Text(
                _gameInfo.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "font4",
                  fontSize: 23,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              primary: false,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: _gameInfo.screenshots.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.deepPurple.shade50,
                          shadowColor: Colors.deepPurple.shade300,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              _gameInfo.screenshots[index].image,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Category : ",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _gameInfo.genre,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Plateform : ",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _gameInfo.platform,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade800,
                          blurRadius: 5,
                        )
                      ],
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Description about Game",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.deepPurple.shade400,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          _gameInfo.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple.shade600,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.deepPurple.shade50,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Minimum System Requirement",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Graphics : ${_gameInfo.minimumSystemRequirements.graphics}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Memory : ${_gameInfo.minimumSystemRequirements.memory}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Operating System : ${_gameInfo.minimumSystemRequirements.os}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Processor : ${_gameInfo.minimumSystemRequirements.processor}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Storage : ${_gameInfo.minimumSystemRequirements.storage}",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final uri = _gameInfo.gameUrl;
                      if (await canLaunchUrlString(uri)) {
                        await launchUrlString(uri);
                      } else {
                        throw "Could not launch";
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Explore More',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Developer:",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              _gameInfo.developer,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Release-date :",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              _gameInfo.releaseDate.toString().substring(0, 10),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
