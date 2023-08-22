class Employee {
  final String name;
  final String avatar;
  final int id;
  String email;
  Employee(
      {required this.id,
      required this.name,
      required this.avatar,
      this.email = "none@email.com"});
  static toEmployee(map) {
    return Employee(
        id: int.parse(map['id']),
        name: map['name'],
        avatar: map['avatar'],
        email: map['email']);
  }
}
