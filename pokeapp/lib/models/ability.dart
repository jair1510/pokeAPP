class Ability {
  final String name;
  final String url;

  Ability({
    required this.name,
    required this.url,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['name'],
      url: json['url'],
    );
  }
}