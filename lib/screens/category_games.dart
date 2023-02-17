import 'package:appophilia/api_responce/apifetch_tags.dart';
import 'package:appophilia/models/game_model.dart';
import 'package:appophilia/screens/gamePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class categoryGame extends StatefulWidget {
  String category;
  categoryGame({required this.category});

  @override
  State<categoryGame> createState() => _categoryGameState();
}

class _categoryGameState extends State<categoryGame> {
  List<Games> _gamesList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGames();
  }

  Future<void> getGames() async {
    _gamesList = await getGameCat(widget.category);
    setState(() {
      isLoading = false;
    });
    print(2);
    print(_gamesList.length);
    print(_gamesList);
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
                "Catagory",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "font5",
                  fontSize: 27,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      widget.category.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "font5",
                        fontSize: 21,
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: _gamesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    gamePage(id: _gamesList[index].id),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.deepPurple.shade200,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Image.network(
                                    _gamesList[index].thumbnail,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Center(
                                    child: Text(
                                      _gamesList[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
