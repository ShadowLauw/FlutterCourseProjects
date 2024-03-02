import 'package:ex4/question.dart';
import 'package:flutter/material.dart';
import 'datas.dart';

class QuestionPage extends StatefulWidget {
  final Color colorTheme;

  QuestionPage({required this.colorTheme});


  @override
  QuestionPageState createState() => QuestionPageState();

}

class QuestionPageState extends State<QuestionPage> {

  Datas myQuestions = Datas();
  int score = 0;
  int questionNumber = 0;
  Question currentQuestion = Datas().listeQuestions[0];

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

        title: Text("Score : $score",),
          backgroundColor: widget.colorTheme,
      ),
      body: Card (
        margin: const EdgeInsets.all(10.0),
        child : Padding(
          padding: const EdgeInsets.all(10.0),
          child : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Question numéro : ${questionNumber + 1} / ${myQuestions.listeQuestions.length}", style: TextStyle(color: widget.colorTheme),),
              Text(currentQuestion.question, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0), textAlign: TextAlign.center,),
              Image(image: AssetImage(currentQuestion.getImage())),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => showAnswer(answer: true),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200], elevation: 5, fixedSize: const Size(90, 30)),
                      child: const Text("VRAI", style: TextStyle(color: Colors.white),)
                  ),
                  ElevatedButton(
                      onPressed: () => showAnswer(answer: false),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200], elevation: 5, fixedSize: const Size(90, 30)),
                      child: const Text("FAUX", style: TextStyle(color: Colors.white),)
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }

  Future<void> showAnswer({required bool answer}) async {
    bool rightAnswer = currentQuestion.reponse == answer;
    String explication = currentQuestion.explication;
    String txt = rightAnswer ? "C'est gagné" : "Raté !";
    String image = rightAnswer ? "vrai" : "faux";
    SimpleDialog myAnswer = SimpleDialog(
      children: [
        Text(txt, textAlign: TextAlign.center,),
        const SizedBox(height: 10,),
        Image(image: AssetImage("images/$image.jpg")),
        const SizedBox(height: 10,),
        if (explication != '')
          Text(explication, textAlign: TextAlign.center,),
        TextButton(onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            if (rightAnswer) {
              score++;
            }
            if (questionNumber == myQuestions.listeQuestions.length - 1) {
              showEndGame();
            } else {
              questionNumber++;
              currentQuestion = myQuestions.listeQuestions[questionNumber];
            }
          });
        }, child: const Text("Passer à la question suivante", textAlign: TextAlign.center,)),
      ],
    );
    await showDialog(barrierDismissible: false, context: context, builder:(BuildContext ctx) {return myAnswer;});
  }

  Future<void> showEndGame() async {
    AlertDialog endGame = AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("C'est fini !", textAlign: TextAlign.center,),
          Text("Votre score est de : $score point${score > 1 ? "s" : ""}"),
        ],
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }, child: Text("OK", style: TextStyle(color: widget.colorTheme, fontWeight: FontWeight.bold, fontSize: 17.0),))
      ],
    );
    await showDialog(barrierDismissible: false, context: context, builder: (BuildContext ctx) {return endGame;});
  }
}