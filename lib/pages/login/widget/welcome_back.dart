import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';



class WelcomeBack extends StatelessWidget {

  const WelcomeBack({
    Key key,
  }) : super(key: key);


@override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
    child: Text(
      'willkommen',
      style: TextStyle(
        color: Colors.teal[900],
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),).tr(),

  );
}
}
