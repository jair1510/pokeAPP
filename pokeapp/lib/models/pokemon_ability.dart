import 'package:pokeapp/models/ability.dart';

class PokemonAbility {
  final Ability ability;
  final bool isHidden;
  final int slot;

  PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      ability: Ability.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}