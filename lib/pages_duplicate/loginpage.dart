// import 'package:flutter/material.dart';
// import 'package:formvalidation_workout/pages_duplicate/homepage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool staySignedin = true;
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _handleLogin() async {
//     if (_usernameController.text.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('please enter username')));
//       return;
//     }
//     if (_passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('please enter password'),
//       ));
//       return;
//     }
//     if (_passwordController.text.length < 6) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('password should be atleast 6 char`'),
//       ));
//       return;
//     }
//     if (_usernameController.text != 'Admin' ||
//         _passwordController.text != 'mypassword') {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('admin and password please...'),
//       ));
//       return;
//     }

//     if (staySignedin) {
//       await SharedPreferences.getInstance().then(
//         (value) => value.setBool('loginState', true),
//       );
//     }
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HomePage(),
//       ),
//     );

//     if(staySignedin){
//       await SharedPreferences.getInstance().then((value) => value.setBool("loginState", true));
//     }
//     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const HomePage(),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Column(children: [
//           SizedBox(
//             height: 20,
//           ),
//           CircleAvatar(
//             backgroundImage: AssetImage('assets/1.jpeg'),
//             radius: 45,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(children: [
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter Username',
//                 ),
//                 controller: _usernameController,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Enter password'),
//                 controller: _passwordController,
//               ),
//               Checkbox(
//                   value: staySignedin,
//                   onChanged: ((value) {
//                     setState(() {
//                       staySignedin = value!;
//                     });
//                   })),
//               SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(onPressed: _handleLogin, child: Text('Login'))
//             ]),
//           )
//         ]),
//       )),
//     );
//   }
// }
