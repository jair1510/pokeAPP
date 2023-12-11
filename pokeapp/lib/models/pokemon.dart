import 'package:pokeapp/models/pokemon_ability.dart';

class Pokemon {
  final List<PokemonAbility> abilities;
  final int baseExperience;
  final String name;
  final String image;
  int? number;
  Pokemon({
    required this.name,
    required this.abilities,
    required this.baseExperience,
    required this.image,
    this.number,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var abilityList = json['abilities'] as List;
    List<PokemonAbility> abilities = abilityList
        .map((ability) => PokemonAbility.fromJson(ability))
        .toList();
    

    return Pokemon(
      name: json['name'] ,
      abilities: abilities,
      baseExperience: json['base_experience'],
      image: json['sprites']['other']['dream_world']['front_default']
    );
  }
}