import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sd_quiz/screens/shared/constants.dart';
import 'package:sd_quiz/screens/welcome/widget/login_and_register.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/quiz.jpg'),
            ),
            SizedBox(height: 10,),
             Text('\n\n'+'willkommensText'.tr(),
                  textAlign: TextAlign.center,
                  style: textStyle2,
             ),
            SizedBox(height: 10,),
            LoginAndRegister(),
              ],
            ),
      ),
    );
  }
}

