import 'package:flutter/material.dart';
import 'package:formvalidation_workout/pages/homepage/myhome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyloginPage extends StatefulWidget {
  const MyloginPage({super.key});

  @override
  State<MyloginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<MyloginPage> {
  bool _isHidden = true;
  bool _logginState = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _MyhandleLogin() async {
    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter username')));
          return;
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter password')));
          return;
    }
    if (_usernameController.text != 'Admin' ||
        _passwordController.text != '123456') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid credentials')));
          return;
    }
    if (_logginState) {
      await SharedPreferences.getInstance()
          .then((value) => value.setBool("mylogin", true));
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/1.jpeg'),
              radius: 50,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Username'),
                    controller: _usernameController,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    obscureText: _isHidden ? true : false,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(Icons.visibility),
                            )),
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password'),
                    controller: _passwordController,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _logginState,
                          onChanged: (value) {
                            setState(() {
                              _logginState = value!;
                            });
                          })
                    ],
                  ),
                  ElevatedButton(
                      onPressed: _MyhandleLogin, child: Text('login'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
