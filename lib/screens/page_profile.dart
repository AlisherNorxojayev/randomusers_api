import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:randomusers_api/randomusers.dart';

class PageProfile extends StatelessWidget {
  PageProfile({Key? key}) : super(key: key);
  Randomusers user = Randomusers('firstName', 'lastName');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(user.firstName),
            Text(user.lastName),
          ],
        ),
      ),
    );
  }
}
