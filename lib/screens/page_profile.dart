import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:randomusers_api/randomusers.dart';
import 'package:http/http.dart' as http;

class PageProfile extends StatefulWidget {
  PageProfile({Key? key}) : super(key: key);

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  Randomusers? user;
  // Randomusers getUser() {
  //   return Randomusers("ass123", 'sdf');
  // }

  bool hasData = false;

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (hasData) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.img),
              radius: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(user!.firstName + " " + user!.lastName),
            const SizedBox(
              height: 40,
            ),
            Text("age - " + user!.age.toString()+ ","),
            Text("city of " + user!.city),
          ],
        ),
      );
    } else {
      body = const Center(
        child: CircularProgressIndicator(),
      );
      getData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: body,
    );
  }

  getData() {
    Uri url = Uri.parse('https://randomuser.me/api/');
    http.get(url).then((value) {
      final data = jsonDecode(value.body);
      Map results = data['results'][0];
      // String first = results['name']['first'];
      // String last = results['name']['last'];
      // String img = results["picture"]["medium"];
      //print(results);
      user = Randomusers.fromJson(results);
      // user = Randomusers(first, last, img);
      // print(results);
      setState(() {
        hasData = true;
      });
      print("end");
    });
    print('start');
  }
}
