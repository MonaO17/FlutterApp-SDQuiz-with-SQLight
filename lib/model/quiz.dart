/* code partly inspired by
       - https://www.youtube.com/watch?v=xke5_yGL0uk&list=PLDQl6gZtjvFu5l20K5KTEBLCjfRjHowLj&index=9
*/

/// model class for quiz-object

class Quiz {
  int itemID;
  int quizID;
  int qTopicID;
  int answerID;
  String question;
  String answerOne;
  String answerTwo;
  String answerThree;
  String answerFour;

  /// constructor [Quiz]
  Quiz(
      {this.quizID,
      this.qTopicID,
      this.answerID,
      this.question,
      this.answerOne,
      this.answerTwo,
      this.answerThree,
      this.answerFour});

  /// converts a quiz-object into a map-object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>(); //instanciate map object

    map['itemID'] = itemID;
    if (itemID != null) {
      map['itemID'] = itemID;
    }
    map['quizID'] = quizID;
    map['qTopicID'] = qTopicID;
    map['answerID'] = answerID;
    map['question'] = question;
    map['answerOne'] = answerOne;
    map['answerTwo'] = answerTwo;
    map['answerThree'] = answerThree;
    map['answerFour'] = answerFour;

    return map;
  }

  /// extracts a quiz-object from a map-object
  Quiz.fromMapObject(Map<String, dynamic> map) {
    this.itemID = map['itemID'];
    this.quizID = map['quizID'];
    this.qTopicID = map['qTopicID'];
    this.answerID = map['answerID'];
    this.question = map['question'];
    this.answerOne = map['answerOne'];
    this.answerTwo = map['answerTwo'];
    this.answerThree = map['answerThree'];
    this.answerFour = map['answerFour'];
  }

  /// receives [json], converts [json] into quiz-object
  factory Quiz.fromJson(dynamic json) {
    return Quiz(
        quizID: json['quizID'],
        qTopicID: json['topicID'],
        answerID: json['answerID'],
        question: "${json['question']}",
        answerOne: "${json['ans1']}",
        answerTwo: "${json['ans2']}",
        answerThree: "${json['ans3']}",
        answerFour: "${json['ans4']}");
  }
}
