class Randomusers {
  final String firstName;
  final String lastName;
  final String img;
  final String imagelarge;
  final String email;
  final int age;

  Randomusers(this.firstName, this.lastName, this.img, this.email, this.age,
      this.imagelarge);

  Randomusers.fromJson(Map data)
      : firstName = data['name']['first'],
        lastName = data["name"]['last'],
        img = data["picture"]["medium"],
        email = data["email"],
        age = data["dob"]["age"],
        imagelarge = data["picture"]["medium"];
}
