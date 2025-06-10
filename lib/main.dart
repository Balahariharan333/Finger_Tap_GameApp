import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: mainApp()));
}

// ignore: camel_case_types
class mainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 22, 104, 244),
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("Start"),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 234, 13, 13),
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("Start"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double Bluecardheight = 0;

  double RedCardheight = 0;

  bool initialized = false;
  int RedScore = 0;
  int BlueScore = 0;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      Bluecardheight = MediaQuery.of(context).size.height / 2;
      RedCardheight = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                Bluecardheight = Bluecardheight + 30;
                RedCardheight = RedCardheight - 30;
                BlueScore = BlueScore + 5;
              });
              double winningheight = MediaQuery.of(context).size.height - 60;

              if (Bluecardheight > winningheight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultpage(BlueScore, "b"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,

            child: Container(
              color: const Color.fromARGB(255, 11, 89, 224),
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              height: Bluecardheight,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Player Blue",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    BlueScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                RedCardheight = RedCardheight + 30;
                Bluecardheight = Bluecardheight - 30;
                RedScore = RedScore + 5;
              });

              double winningHeight = MediaQuery.of(context).size.height - 60;
              if (RedCardheight > winningHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultpage(RedScore, "a"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: const Color.fromARGB(255, 239, 5, 5),
              height: RedCardheight,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Player Red",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    RedScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class resultpage extends StatelessWidget {
  int score = 0;
  String player = "";
  resultpage(this.score, this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "a" ? "Player Red Won" : "Player Blue Won",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
