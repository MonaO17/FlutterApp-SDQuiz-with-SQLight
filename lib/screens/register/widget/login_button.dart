import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sd_quiz/screens/shared/constants.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        shape: quizButtonShape,
        color: mainColorSD,
        onPressed: () {},
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            'login',
            style: TextStyle(
              color: Colors.white,
            ),
          ).tr(),
        ),
      ),
    );
  }

  void checkPassword(String pw, String pw2) {
    if (pw != pw2) {
      _showAlertDialog('Fehler!',
          'Ihre Passwörter stimmen nicht überein. Versuchen Sie es erneut.');
    } else {
      // Failure
      _showAlertDialog('Willkommen!',
          'Sie haben sich erfolgreich registriert. Viel Spaß beim spielen!');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
