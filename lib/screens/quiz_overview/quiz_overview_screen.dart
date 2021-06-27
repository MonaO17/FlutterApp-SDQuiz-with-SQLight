import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sd_quiz/model/topic.dart';
import 'package:sd_quiz/model/user.dart';
import 'package:sd_quiz/screens/quiz/quiz_screen.dart';
import 'package:sd_quiz/screens/quiz_overview/widget/drawer_navigation.dart';
import 'package:sd_quiz/screens/shared/loading.dart';
import '../../database/database_helper.dart';
import '../settings/language_screen.dart';

class QuizOverviewScreen extends StatefulWidget {
  int idCurrentUser;

  //constructor
  QuizOverviewScreen({Key key, @required this.idCurrentUser}) : super(key: key);

  @override
  _QuizOverviewScreenState createState() =>
      _QuizOverviewScreenState(idCurrentUser);
}

class _QuizOverviewScreenState extends State<QuizOverviewScreen> {
  int idCurrentUser;
  DatabaseHelper helper = DatabaseHelper();
  User user;
  List<Topic> topic;
  Future userFuture;

  //constructor
  _QuizOverviewScreenState(this.idCurrentUser);

  @override
  void initState() {
    super.initState();
    _getTopics();
    userFuture = _getUser(idCurrentUser);
  }

  _getTopics() async {
    print('get Topics');
    topic = await helper.getTopicList();
  }

  _getUser(idCurrentUser) async {
    print('user $idCurrentUser');
    user = await helper.getCurrentUser(idCurrentUser);
    print(user.name);
    return user;
  }

  String dropdownValue = 'Deutsch - DE';
  String icon = "uk.png";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // total height and with from device
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.language),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
              },
            ),
          ),
        ],
        backgroundColor: Colors.teal[800],
      ),
      drawer: DrawerNavigation(idCurrentUser: idCurrentUser),
      body: FutureBuilder(
          future: userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                            child: Text(
                              'willkommen'.tr() + " ${snapshot.data.name}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.teal[900],
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: GridView.count(
                          // crossAxisCount is the number of columns
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          // This creates two columns with two items in each column
                          children: List.generate(topic.length, (index) {
                            return CategoryCard(
                              title: ('${topic[index].topic}'),
                              image: topic[index].topicPic,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return QuizScreen(
                                          topicID: topic[index].topicID,
                                          idCurrentUser: idCurrentUser); // Quizseite verlinken
                                    },
                                  ),
                                );
                              }, //Verlinkung zu Quizfragen
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Loading();
            }
          }),
    );

    //),
  }
}

// Initial Kategorie Feld /
class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final Function press;

  const CategoryCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      //borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.grey[100],
          borderRadius: BorderRadius.circular(13),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  Expanded(
                    child: Image.network(image),
                    flex: 6,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
