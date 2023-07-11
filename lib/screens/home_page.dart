import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:randomusers_api/models/randomusers.dart';
import 'package:http/http.dart' as http;
import 'package:randomusers_api/screens/user_profile_page.dart';

class PageProfile extends StatefulWidget {
  PageProfile({Key? key}) : super(key: key);

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  Future<Randomusers> getdata() async {
    Uri url = Uri.parse('https://randomuser.me/api/');

    http.Response _response = await http.get(url);
    // print(_response.body);

    Map data = jsonDecode(_response.body);

    Map results = data['results'][0];

    Randomusers user = Randomusers.fromJson(results);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              Randomusers user = snapshot.data as Randomusers;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.imagelarge),
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.firstName + " " + user.lastName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("UI/UX Designer"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.circle,
                              color: Colors.green,
                            ),
                            title: Text(
                              "Active",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_downward_outlined),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            hoverColor:
                                const Color.fromARGB(255, 153, 185, 239),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(user: user),
                                  ));
                            },
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 40,
                            ),
                            title: Text(
                              "Profile",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            hoverColor:
                                const Color.fromARGB(255, 153, 185, 239),
                            onTap: () {
                              print("tap");
                            },
                            leading: Icon(
                              Icons.message,
                              color: Colors.black,
                              size: 40,
                            ),
                            title: Text(
                              "Messages",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            hoverColor:
                                const Color.fromARGB(255, 153, 185, 239),
                            onTap: () {
                              print("tap");
                            },
                            leading: Icon(
                              Icons.badge_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                            title: Text(
                              "My Protfolio",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            hoverColor:
                                const Color.fromARGB(255, 153, 185, 239),
                            onTap: () {
                              print("tap");
                            },
                            leading: Icon(
                              Icons.location_history,
                              color: Colors.black,
                              size: 40,
                            ),
                            title: Text(
                              "Location",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            hoverColor:
                                const Color.fromARGB(255, 153, 185, 239),
                            onTap: () {
                              print("tap");
                            },
                            leading: Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 40,
                            ),
                            title: Text(
                              "Settings",
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PageProfile(),
              ));
        },
      ),
    );
  }
}
