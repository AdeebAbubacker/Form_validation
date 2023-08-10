import 'package:flutter/material.dart';
import 'package:formvalidation_workout/extracted_widgets/product_card.dart';
import 'package:formvalidation_workout/services/product_apis.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: 
        Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Myproducts',
                  style:
                      GoogleFonts.abhayaLibre(textStyle: TextStyle(fontSize: 23)),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: ProductApis.fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List products = snapshot.data!;
                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.3 / 2),
                        itemBuilder: (context, index) {
                          return Myproducts(
                              title: products[index]["title"],
                              imgUrl: products[index]["thumbnail"],
                              price: products[index]["price"]);
                        },
                      );
                    }
                    return Center(
                          child: CircularProgressIndicator(),
                        );
                  },
                ),
              )
            ],
          ),
      ),
    );
  }
}