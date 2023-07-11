import 'package:flutter/material.dart';
import 'package:randomusers_api/models/randomusers.dart';

class ProfilePage extends StatelessWidget {
  final Randomusers user;
  const ProfilePage({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.network(user.imagelarge),
                  const SizedBox(
                    height: 5,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.firstName + user.lastName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'UI/UX Designer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //  Stack(

                  //   children: <Widget>[
                  //     Image.asset('lib/images/shape.png'),
                  //   ],
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '\tPROFILE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
             ListTile(
              leading: Icon(
                size: 40,
                Icons.person,
                color: Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(user.firstName + user.lastName),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const ListTile(
              leading: Icon(
                size: 40,
                Icons.phone_outlined,
                color: Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text('+24500000000'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
             ListTile(
              leading: Icon(
                size: 40,
                Icons.message_sharp,
                color: Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(child: Text(user.email)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Other Ways People Can Find Me',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/twitter.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/insta.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/face.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/in.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.black,
                size: 40,
              ),
              title: const Text(
                'Help and Feedback',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.black,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
