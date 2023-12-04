import 'package:flutter/material.dart';
import 'package:pokeapp/controller/api_pokemon.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/screen/buscador/card_buscador.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
    pokemonList = fetchFirstPokemons(); // Llama a la función para obtener los primeros 10 Pokémon
  }

  Future<List<Pokemon>> fetchFirstPokemons() async {
    List<Pokemon> pokemonDataList = [];
    for (int i = 1; i <= 150; i++) {
      Pokemon pokemon = await PokemonAPI.fetchPokemonData(i.toString());
      pokemonDataList.add(pokemon);
    }
    return pokemonDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: pokemonList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CardSearch(pokemon: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
