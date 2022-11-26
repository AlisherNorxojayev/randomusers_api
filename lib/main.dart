import 'package:flutter/material.dart';
import 'package:randomusers_api/screens/page_profile.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageProfile(),
    );
  }
}
