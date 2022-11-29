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
      body = Text(user!.firstName);
    } else {
      body = Center(
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
      String first = results['name']['first'];
      String last = results['name']['last'];
      user = Randomusers(first, last);
      setState(() {
        hasData = true;
      });
      print(hasData);
    });
    print('end');
  }
}
