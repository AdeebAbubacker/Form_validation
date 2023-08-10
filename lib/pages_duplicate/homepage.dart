// import 'dart:convert';

// import 'package:formvalidation_workout/pages_duplicate/loginpage.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<List> fetchProducts() async {
//     var response = await http.get(Uri.parse('https://dummyjson.com/products'));
//     var body = json.decode(response.body);
//     var products = body["products"];
//     return products;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//       ),
//       drawer: Drawer(
//         backgroundColor: Colors.cyan,
//         child: Column(
//           children: [
//             const DrawerHeader(
//               child: Center(
//                 child: CircleAvatar(
//                   child: Text("APP"),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 400,
//             ),
//             TextButton(
//                 onPressed: () {
//                   SharedPreferences.getInstance()
//                       .then((prefs) => prefs.setBool('loginState', false));
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                       (route) => false);
//                 },
//                 child: const Text("Logout"))
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'My HomePage',
//                   style: TextStyle(fontSize: 23),
//                 ),
//                 FutureBuilder(
//                     future: fetchProducts(),
//                     builder: (context, snapshot) {
//                       List products = snapshot.data!;
//                       if (snapshot.hasData) {
//                         return Expanded(
//                           child: GridView.builder(
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       childAspectRatio: 2 / 3.7),
//                               itemCount: products.length,
//                               itemBuilder: (context, index) {
//                                 return ProductCard(
//                                     title: products[index]["title"],
//                                     imgUrl: products[index]["images"][0],
//                                     // desc: products[index]["description"],

//                                     price: products[index]["price"]);
//                               }),
//                         );
//                       } else {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Padding ProductCard({title, imgUrl, price}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 190,
//         height: 270,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           color: const Color.fromARGB(137, 232, 230, 230),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             Image.network(
//               imgUrl,
//               height: 100,
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Text(
//             //     desc,
//             //     textAlign: TextAlign.center,
//             //   ),
//             // ),
//             Text('price Rs.$price')
//           ],
//         ),
//       ),
//     );
//   }
// }
// //----------------------------------------------------------------------------------------------------------
// //Algorithm for calling api

// //1. first a var1 = http.get(uri.parse('endpoint'));
// //2. then a var2 = json.decode(var.body);
// //3. then from api , what should we get should be mentioned , in our case "products",
// //   so var3 = var2["products"]
// //4. Now return var3;

// // Algorithm 
// // in FutureBuilder widget.
// // future : call function for api calling.
// // in builder(context,snapshot){
// //   we also define snapshot 
// //   List var3 = snapshot.data!

// //   and in if(snapshop.hasdata){
// //            return a widget;
// //                              }
// //          else return another widget;
// // }