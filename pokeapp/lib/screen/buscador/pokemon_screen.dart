import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';

class PokemonScreen extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonScreen({super.key, required this.pokemon});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${widget.pokemon.name}'),
                  Text('Base Experience: ${widget.pokemon.baseExperience}'),
                  Column(
                    children: widget.pokemon.abilities.map((ability) {
                      return Column(
                        children: [
                          Text('Ability Name: ${ability.ability.name}'),
                          Text('Is Hidden: ${ability.isHidden}'),
                          Text('Slot: ${ability.slot.toString()}'),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              );
  }
}