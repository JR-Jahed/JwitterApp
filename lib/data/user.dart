class User {
  int id;
  String name;
  String email;
  String password;
  String? address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
  });

  User.fromJson(final json) :
    id = json['id'],
    name = json['name'],
    email = json['email'],
    password = json['password'],
    address = json['address'];


  @override
  String toString() {

    return "{\"id\":$id,\"name\":\"$name\",\"email\":\"$email\",\"password\":\"$password\",\"address\":\"$address\"}";
  }
}
