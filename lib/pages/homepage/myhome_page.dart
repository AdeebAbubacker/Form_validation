import 'package:flutter/material.dart';
import 'package:formvalidation_workout/pages/homepage/view/homepage_view.dart';
import 'package:formvalidation_workout/pages/homepage/view/postpages_view.dart';
import 'package:formvalidation_workout/pages/mylogin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;
  PageController homeViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 70, 70),
      ),
      drawer: buildDrawer(context),
      body: PageView(
        controller: homeViewController,
        onPageChanged: (index) {
          setState(() {
            navIndex = index;
          });
        },
        children: const [HomePageView(), PostPageView()],
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: navIndex,
      onTap: (index) {
        homeViewController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        setState(() {
          navIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Posts",
          icon: Icon(Icons.note),
        )
      ],
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.cyan,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: Text("APP"),
                  ),
                  Text("My app")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 400,
          ),
          TextButton(
              onPressed: () {
                SharedPreferences.getInstance()
                    .then((prefs) => prefs.setBool("mylogin", false));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyloginPage(),
                    ),
                    (route) => false);
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
