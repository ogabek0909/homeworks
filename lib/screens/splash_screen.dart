import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeworks/screens/groups_screen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SplshScreen extends StatelessWidget {
  const SplshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        curve: Curves.fastLinearToSlowEaseIn,
        splashIconSize: MediaQuery.of(context).size.height,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/codeschool.jpg',
              fit: BoxFit.cover,
            ),
            AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
              TyperAnimatedText(
                'WELCOME TO CODESCHOOL',
                textStyle: GoogleFonts.adamina(
                    fontSize: 40, fontWeight: FontWeight.w900),
                speed: const Duration(milliseconds: 100),
                textAlign: TextAlign.center,
              ),
              //RotateAnimatedText('CODESCHOOL',textStyle: GoogleFonts.adamina(fontSize: 40,fontWeight: FontWeight.w900),),
            ]),
          ],
        ),
        
        nextScreen: const GroupsScreen());
  }
}
/*
 Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/codeschool.jpg',
              fit: BoxFit.cover,
            ),
            Text('CODESCHOOL',style: GoogleFonts.adamina(fontSize: 30,fontWeight: FontWeight.w900),)
          ],
        ),
*/