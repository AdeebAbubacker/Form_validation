import 'package:flutter/material.dart';
import 'package:formvalidation_workout/pages/homepage/myhome_page.dart';
import 'package:formvalidation_workout/pages/mylogin_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    initialChecks();
    super.initState();
  }
  //so when app reloads this method checks for current

  initialChecks() async {
    await Future.delayed(const Duration(seconds: 4));
    var prefs = await SharedPreferences.getInstance();

    bool loginState = prefs.getBool("mylogin") ?? false;

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        if (loginState) {
          return const HomePage();
        } else {
          return const MyloginPage();
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.bouncingBall(
                color: const Color.fromARGB(255, 0, 0, 0), size: 300),
          ],
        ),
      )),
    );
  }
}
