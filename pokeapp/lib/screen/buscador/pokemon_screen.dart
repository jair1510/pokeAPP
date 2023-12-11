import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/screen/buscador/widget/card_pokemon.dart';

class PokemonScreen extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonScreen({super.key, required this.pokemon});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '#${widget.pokemon.number}',
                    style: TextStyle(
                      fontSize: 40.0,  ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              SvgPicture.network(
                widget.pokemon.image,
                width: 200,
                height: 200,
                placeholderBuilder: (BuildContext context) =>
                    CircularProgressIndicator(),
              ),
             
            ],
          ),
           CardPokemon(pokemon: widget.pokemon)
        ],
      ),
    );
  }
}
