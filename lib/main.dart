import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizApp();
}

class _QuizApp extends State {
  List<Map> mylist = [
    {
      "Question": "What programming language is used to write Flutter apps?",
      "Options": ["A. Java", "B. Dart", "C. Kotlin", "D.Swift"],
      "correctanswer": 1,
    },
    {
      "Question":
          "Which widget is used for creating layouts in a vertical direction?",
      "Options": ['A. Row', 'B. Column', 'C. Stack', 'D. ListView'],
      "correctanswer": 1,
    },
    {
      "Question": " What is the entry point of Flutter application?",
      "Options": ['A. startApp()', 'B. main()', 'C. runApp()', 'D. initApp()'],
      "correctanswer": 1,
    },
    {
      "Question":
          "Which widget is used to make something scrollable in Flutter?",
      "Options": [
        'A. Stack',
        'B. GridView',
        'C.SingleChildScrollView',
        'D. Wrap',
      ],
      "correctanswer": 2,
    },
    {
      "Question": "How do you add padding around a widget?",
      "Options": [
        'A. Margin',
        'B.EdgeInsets',
        'C.Padding widget',
        'D. SpaceBox',
      ],
      "correctanswer": 2,
    },
  ];
  int selectedindex = -1;

  int questionno = 0;
  int score = 0;
  bool isQuestionPage = true;
  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedindex != -1) {
      if (answerIndex == mylist[questionno]['correctanswer']) {
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedindex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,

          title: Center(
            child: Text(
              "Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                "Question:${questionno + 1}/${mylist.length}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 110,
                    width: 340,

                    child: Text(
                      mylist[questionno]['Question'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedindex == -1) {
                    selectedindex = 0;
                    setState(() {});
                  }
                },
                child: Text(
                  mylist[questionno]['Options'][0],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedindex == -1) {
                    selectedindex = 1;
                    setState(() {});
                  }
                },
                child: Text(
                  mylist[questionno]['Options'][1],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedindex == -1) {
                    selectedindex = 2;
                    setState(() {});
                  }
                },
                child: Text(
                  mylist[questionno]['Options'][2],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedindex == -1) {
                    selectedindex = 3;
                    setState(() {});
                  }
                },
                child: Text(
                  mylist[questionno]['Options'][3],
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedindex != -1) {
              if (selectedindex == mylist[questionno]['correctanswer']) {
                score++;
              }

              if (questionno < mylist.length - 1) {
                questionno++;
                selectedindex = -1;
              } else {
                isQuestionPage = false;
              }
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.purple,

                  content: Text(
                    "Please choose the option!!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
          },
          child: Icon(Icons.arrow_forward, size: 30, color: Colors.black),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text("Result Screen", style: TextStyle(fontSize: 30)),
        ),
        body: Column(
          children: [
            SizedBox(height: 70),
            Center(
              child: Image.network(
                "https://images-cdn.ubuy.co.in/660d83c65c32f33c91299d6c-caydo-16-3inch-gold-award-trophy-large.jpg",
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Congratulations",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              "Score:$score/${mylist.length}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  isQuestionPage = true;
                  selectedindex = -1;
                  questionno = 0;
                  quizAppPage();
                  score = 0;
                  setState(() {});
                },
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
