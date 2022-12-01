class Randomusers {
  final String firstName;
  final String lastName;
  final String img;
  final String imagelarge;
  final String city;
  final int age;

  Randomusers(this.firstName, this.lastName, this.img, this.city, this.age,
      this.imagelarge);

  Randomusers.fromJson(Map data)
      : firstName = data['name']['first'],
        lastName = data["name"]['last'],
        img = data["picture"]["medium"],
        city = data["location"]["city"],
        age = data["dob"]["age"],
        imagelarge = data["picture"]["large"];
}
