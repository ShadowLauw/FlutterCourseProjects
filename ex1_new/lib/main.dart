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
      title: 'AppExo1',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: windowSize.width,
        height: windowSize.height,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/cover.jpg"), fit: BoxFit.cover)
                      ),
                      height: 200,
                      width:  windowSize.width,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 125),
                      child: CircleAvatar(
                        foregroundImage: AssetImage("images/profile.jpg"),
                        radius: 75,
                      ),
                    )

                  ],
                ),
                const Text(
                  "Lauw Paraboschi",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7.5),
                  height: 57.5,
                  width: windowSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          height: 50,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: const Center(
                                child: Text(
                                  "Modifier le profil",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),
                                  textAlign: TextAlign.center,
                                  )
                          )
                        ),
                      Container(
                        height: 40,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.border_color, color: Colors.white)
                      )
                    ],
                  ),
                ),
                Container(
                  width: windowSize.width,
                  height: 120,
                  padding: EdgeInsets.all(7.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                      padding: EdgeInsets.only(left: 3.5),
                      child: Text(
                        "À propos de moi",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                      Row(
                        children: [
                          Icon(Icons.house, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: textAPropos("Genève, Suisse"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: textAPropos("Developpeuse App"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: textAPropos("En couple"),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Amis",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addFriend("Nicolas Ettlin", "ettlin", (windowSize.width-40)/3),
                            addFriend("Simon Lefort", "simon", (windowSize.width-40)/3),
                            addFriend("Salim Najib", "salim", (windowSize.width-40)/3)
                          ],
                      )
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      post(time: 5, like: 36, comment: 12, desc: "Une belle montagne", imagepath: "mountain", width: windowSize.width),
                      post(time: 6, like: 24, comment: 13, desc: "Un beau carnaval", imagepath: "carnaval", width: windowSize.width),
                      post(time: 7, like: 12, comment: 2, desc: "J'ai été à la plage !", imagepath: "playa", width: windowSize.width),
                      post(time: 8, like: 14, comment: 5, desc: "My cutie cat Bob", imagepath: "cat", width: windowSize.width),
                      post(time: 8, like: 17, comment: 12, desc: "J'aime les tournesols", imagepath: "sunflower", width: windowSize.width),
                      post(time: 9, like: 27, comment: 8, desc: "Moi au travail", imagepath: "work", width: windowSize.width),
                      post(time: 10, like: 25, comment: 25, desc: "Ducking duck", imagepath: "duck", width: windowSize.width)
                    ],
                  )
                )
              ],
            )
        )
      )
    );
  }
}

Text textAPropos(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
    )
  );
}

Column addFriend(String name, String pathImage, width) {
  return Column(
    children: [
      Container(
          width: width,
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
              image: AssetImage("images/$pathImage.jpg"),
              fit: BoxFit.cover,
            ),
          ),
      ),
      Text(name)
    ],
  );
}

Container post({required int time, required int like, required int comment, required String desc, required String imagepath, required double width}) {
  return Container(
    width: width,
    height: 430,
    color: Colors.grey,
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(foregroundImage: AssetImage("images/profile.jpg"), radius: 30),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Lauw Paraboschi")
            ),
            Expanded(
              child: Text("Il y a $time heures", textAlign: TextAlign.right),
            ),
          ],
        ),
        Container(
          width: width,
          height: 250,
          child: Image(image: AssetImage("images/$imagepath.jpg"), fit: BoxFit.cover)
        ),
        Text(desc, textAlign: TextAlign.left),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite),
                Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: Text("$like likes")
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.comment),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text("$comment commentaires"),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}