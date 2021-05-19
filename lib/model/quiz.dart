class Quiz {
  int itemID;
  int quizID;
  int answerID;
  String question;
  String answerOne;
  String answerTwo;
  String answerThree;
  String answerFour;

  // constructor
  Quiz({this.quizID, this.answerID, this.question, this.answerOne,
    this.answerTwo, this.answerThree, this.answerFour}); // [] makes the description optional!
/*
  // named constructor
  Quiz.withID(this._quizID, this._answerID, this._question, this._answerOne,
      this._answerTwo, [this._answerThree, this._answerFour]);

  //Getters
  int get itemID => _itemID;
  int get quizID => _quizID;
  int get answerID => _answerID;
  String get question => _question;
  String get answerOne => _answerOne;
  String get answerTwo => _answerTwo;
  String get answerThree => _answerThree;
  String get answerFour => _answerFour;

  //Setters
  set quizID(int value) { _quizID = value; }
  set answerID(int value) { _answerID = value; }
  set question(String value) { _question = value; }
  set answerOne(String value) { _answerOne = value;}
  set answerTwo(String value) { _answerTwo = value; }
  set answerThree(String value) { _answerThree = value; }
  set answerFour(String value) { _answerFour = value; }


 */
  //Convert a Quiz object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>(); //instanciate map object

    map['itemID'] = itemID;
    if (itemID != null) {
      map['itemID'] = itemID;
    }
    map['quizID'] = quizID;
    map['answerID'] = answerID;
    map['question'] = question;
    map['answerOne'] = answerOne;
    map['answerTwo'] = answerTwo;
    map['answerThree'] = answerThree;
    map['answerFour'] = answerFour;

    return map;
  }

  //Extract a Quiz object from a Map object
  Quiz.fromMapObject(Map<String, dynamic> map){
    this.itemID = map['itemID'];
    this.quizID = map['quizID'];
    this.answerID = map['answerID'];
    this.question = map['question'];
    this.answerOne = map['answerOne'];
    this.answerTwo = map['answerTwo'];
    this.answerThree = map['answerThree'];
    this.answerFour = map['answerFour'];
  }

  // convert JSON that we get into this model(=QuizContentHelper) in this class (seperate Strings etc.),
  // so that we can create a list of this model and then show the details in a list view
  factory Quiz.fromJson(dynamic json) {
    return Quiz(
      //itemID: json['itemID'],
        quizID: json['quizID'],
        answerID: json['answerID'],
        question: "${json['question']}",
        answerOne: "${json['ans1']}",
        answerTwo: "${json['ans2']}",
        answerThree: "${json['ans3']}",
        answerFour: "${json['ans4']}"
    );
  }





}
