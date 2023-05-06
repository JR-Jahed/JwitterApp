class User {
  String name;
  String email;
  String password;
  String? address;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
  });

  User.fromJson(final json) :
    name = json['name'],
    email = json['email'],
    password = json['password'],
    address = json['address'];


  @override
  String toString() {

    return "{\"name\":\"a\",\"email\":\"a\",\"password\":\"a\",\"address\":null}";
  }
}
// {"name":"a","email":"a","password":"a","address":null}