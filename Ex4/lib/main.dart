import 'package:flutter/material.dart';
import 'question_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizApp',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white)
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title = "Quiz Flutter";

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Card(
          color: Theme.of(context).primaryColorLight,
          elevation: 10.0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/2.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/cover.jpg"), fit: BoxFit.cover)),
                ),
                ElevatedButton(
                    onPressed: () {
                      QuestionPage questionPage = QuestionPage(colorTheme: Theme.of(context).primaryColor);
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx) {return questionPage;}));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    child: const Text("Commencer le quiz", style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
