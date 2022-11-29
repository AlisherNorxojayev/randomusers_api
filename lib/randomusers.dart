class Randomusers {
  final String firstName;
  final String lastName;

  Randomusers(this.firstName, this.lastName);

  Randomusers.fromJson(Map data)
      : firstName = data['first'],
        lastName = data['last'];
}
