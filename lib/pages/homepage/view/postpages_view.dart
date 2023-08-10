import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formvalidation_workout/extracted_widgets/product_card.dart';
import 'package:formvalidation_workout/services/auth_apis.dart';
import 'package:http/http.dart' as http;

class PostPageView extends StatefulWidget {
  const PostPageView({super.key});

  @override
  State<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends State<PostPageView> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: postsApi.fetchposts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List myproducts = snapshot.data!;
            return GridView.builder(
              itemCount: myproducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.3 / 2),
              itemBuilder: (context, index) {
                final title =
                    myproducts[index]["title"] as String? ?? "No Title";
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('sss');
          }
        },
      )),
    );
  }
}
