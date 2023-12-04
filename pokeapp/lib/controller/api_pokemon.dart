import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokeapp/models/pokemon.dart';

class PokemonAPI{

    static Future<Pokemon> fetchPokemonData(String number) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/' +
    number));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> pokemonData = json.decode(response.body);

      Pokemon pokemon = Pokemon.fromJson(pokemonData);
      return pokemon;
      // Puedes acceder a más detalles y trabajar con los datos según tu aplicación
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }
}