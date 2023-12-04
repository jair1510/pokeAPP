import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/models/pokemon.dart';

class CardSearch extends StatelessWidget {
  final Pokemon pokemon;
  const CardSearch({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          SvgPicture.network(
            pokemon.image,
            width: 100,
            height: 100,
             placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Name: ${pokemon.name}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Experience: ${pokemon.baseExperience}',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
