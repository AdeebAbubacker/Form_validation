import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myproducts extends StatelessWidget {
  Myproducts({super.key, this.title, this.imgUrl, this.desc, this.price});

  var title, imgUrl, desc, price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color.fromARGB(100, 232, 237, 235),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: GoogleFonts.aboreto(),
              textAlign: TextAlign.center,
            ),
            Image.network(
              imgUrl,
              height: 100,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     desc,
            //     overflow: TextOverflow.ellipsis,
            //     maxLines: 3,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Text(
                    'price Rs.$price',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
//-----------------------------------------------------------------------------------------
