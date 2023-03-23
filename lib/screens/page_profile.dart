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

  Future<String> getdata() async {
    String x = "Alisher";
    Uri url = Uri.parse('https://randomuser.me/api/');
    http.Response _response = await http.get(url);
    final data = jsonDecode(_response.body);
    Map results = data['results'][0];
    user = Randomusers.fromJson(results);
    hasData = true;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata(),
          initialData: "done all",
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user!.imagelarge),
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user!.firstName + " " + user!.lastName),
                    const SizedBox(
                      height: 40,
                    ),
                    Text("age - " + user!.age.toString() + ","),
                    Text("city of " + user!.city),
                    SizedBox(
                      height: 50,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "home");
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(children: [
                  Text("No Internet"),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "home");
                      },
                      icon: Icon(Icons.refresh))
                ]),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
