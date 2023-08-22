class Company {
  final int id, key;
  final String name, image, country, city;
  Company({
    required this.id,
    required this.name,
    required this.image,
    required this.country,
    required this.city,
    required this.key,
  });
  static toCompany(map) {
    return Company(
        id: int.parse(map['CompanyId']),
        name: map['name'],
        image: map['image'],
        country: map['country'],
        city: map['city'],
        key: map['key']);
  }
}
