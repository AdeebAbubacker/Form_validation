import 'dart:convert';
import 'package:http/http.dart' as http;


class postsApi{
 static Future fetchposts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var mydata = json.decode(response.body);
    return mydata;
  }
}