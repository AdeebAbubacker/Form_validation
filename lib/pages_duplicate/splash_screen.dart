// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     initialChecks();
//     super.initState();
//   }
//   //so when app reloads this method checks for current

//   initialChecks() async {
//     await Future.delayed(const Duration(seconds: 3));
//     var prefs = await SharedPreferences.getInstance();

//     bool loginState = prefs.getBool('loginState') ?? false;

//   //   // ignore: use_build_context_synchronously
//   //   Navigator.pushReplacement(context, MaterialPageRoute(
//   //     builder: (context) {
//   //       if (loginState) {
//   //         return const HomePage();
//   //       } else {
//   //         return const LoginPage();
//   //       }
//   //     },
//   //   ));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Image.asset('assets/1.jpeg'), Text('please wait...')],
//         ),
//       )),
//     );
//   }
// }
