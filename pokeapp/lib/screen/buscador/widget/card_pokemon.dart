import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Base Experience: ${pokemon.baseExperience}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Ability:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pokemon.abilities.map((ability) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ability Name: ${ability.ability.name}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Slot: ${ability.slot.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Divider(),
                  ],
                );
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
