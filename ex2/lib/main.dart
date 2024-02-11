import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exo2',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primaryColorLight: Colors.deepPurple[100]
      ),
      home: MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => MyProfilePageState();
}

class MyProfilePageState extends State<MyProfilePage> {

  String firstName = "";
  String surname = "";
  double age = 0.0;
  double size = 0.0;
  int favLanguage = 0;
  String hobbiesString = "";
  String genderName = "Masculin";
  bool gender = false;
  bool secretPressed = false;
  late TextEditingController secret;
  Map<String, bool> hobbies = {
    "Pétanque" : false,
    "Football" : false,
    "Gym" : false,
    "Escalade" : false,
    "Patinage" : false
  };
  List<String> language = ["Dart", "Kotlin", "Java", "Swift", "Python"];



  @override
  void initState() {
    super.initState();
    secret = TextEditingController();
  }
  @override
  void dispose() {
    secret.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Mon Profil", style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10.0,
                  child: Container(
                    color: Theme.of(context).primaryColorLight,
                    width: screenSize.width,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Text("$firstName $surname"),
                        Text("Âge : ${age.toInt()} " + (age > 1 ? "ans" : "an")),
                        Text("Taille : ${size.toInt()} cm"),
                        Text("Genre : $genderName"),
                        Text("Hobbies : $hobbiesString"),
                        Text("Language de programmation favori : ${language[favLanguage]}"),
                        ElevatedButton(
                          onPressed: (() {
                            setState(() {
                              secretPressed = !secretPressed;
                            });
                          }),
                          child: Text("Montrer secret", style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                        ),
                        if (secretPressed && secret.text != "")
                          Text(secret.text)
                      ],
                    ),
                  )
                ),
                Divider(
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                ),
                categoryText("Modifier les infos"),
                Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(hintText: "Entrez votre prénom"),
                        onSubmitted: ((newValue) {
                          setState(() {
                            firstName = newValue;
                          });
                        }
                        )
                      ),
                      TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(hintText: "Entrez votre nom"),
                          onSubmitted: ((newValue) {
                            setState(() {
                              surname = newValue;
                            });
                          }
                          )
                      ),
                      TextField(
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          controller: secret,
                          decoration: InputDecoration(hintText: "Dites nous un secret"),
                          onSubmitted: ((newValue) {
                            setState(() {
                              secret.text = newValue;
                            });
                          }
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Genre : $genderName"),
                          Switch(value: gender, onChanged: ((newValue) {
                            setState(() {
                              gender = newValue;
                              genderName = ((gender) ? "Féminin" : "Masculin");
                            });
                          }))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taille : ${size.toInt()} cm"),
                          Slider(
                              value: size,
                              onChanged: ((newValue) {
                                setState(() {
                                  size = newValue;
                                });
                              }),
                            min: 0.0,
                            max: 250.0,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Âge : ${age.toInt()} " + (age > 1 ? "ans" : "an")),
                          Slider(
                            value: age,
                            onChanged: ((newValue) {
                              setState(() {
                                age = newValue;
                              });
                            }),
                            min: 0.0,
                            max: 199,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                ),
                categoryText("Mes Hobbies"),
                Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: getHobbies(),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                ),
                categoryText("Language préféré"),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getLanguage(),
                ),)
              ],
          ),
        ),
      );
  }

  List<Widget> getHobbies() {
    List<Widget> hobbiesWidget = [];
    hobbies.forEach((hobby, isChecked) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobby),
          Checkbox(value: isChecked, onChanged: ((newValue) {
            setState(() {
              hobbies[hobby] = newValue ?? false;
              updateHobbiesString();
            });
          }))
        ],
      );
      hobbiesWidget.add(row);
    });
    return hobbiesWidget;
  }

  void updateHobbiesString() {
    hobbiesString = "";
    hobbies.forEach((hobby, isChecked) {
      if (isChecked) {
        hobbiesString += "$hobby ";
      }
    });
  }

  List<Widget> getLanguage() {
    List<Widget> languageList = [];
    for (int i = 0; i < language.length; ++i) {
      Column column = Column(
        children: [
          Text(language[i]),
          Radio(value: i, groupValue: favLanguage, onChanged: ((newValue) {
            setState(() {
              favLanguage = newValue as int;
            });
          }))
        ],
      );
      languageList.add(column);
    }
    return languageList;
  }
}

Text categoryText(String name) {
  return Text(
    name,
    style: const TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w900,
      fontSize: 17
    ),
  );
}