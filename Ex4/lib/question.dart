class Question {

  String question;
  bool reponse;
  String explication;
  String imagePath;

  Question({
    required this.question,
    required this.reponse,
    required this.explication,
    required this.imagePath
  });

  String getImage() => 'images/$imagePath';
}