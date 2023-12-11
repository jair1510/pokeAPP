import 'package:easy_search_bar/easy_search_bar.dart';
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
  String searchValue = '';
  late Future<List<Pokemon>> pokemonList;
  List<Pokemon> displayedPokemons = []; // Lista a mostrar en el ListView
  List<Pokemon> allPokemons = []; // Copia de respaldo de todos los Pokémon
  bool isLoading = true;
  int loadedPokemonCount = 0; // Contador para mostrar el progreso de carga

  @override
  void initState() {
    super.initState();
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    List<Pokemon> pokemonDataList = [];
    for (int i = 1; i <= 150; i++) {
      Pokemon pokemon = await PokemonAPI.fetchPokemonData(i.toString());
      pokemon.number = i;
      pokemonDataList.add(pokemon);
      setState(() {
        loadedPokemonCount = i; // Actualiza el contador de Pokémon cargados
      });
    }
    setState(() {
      allPokemons =
          pokemonDataList; // Establece la copia de respaldo de todos los Pokémon
      displayedPokemons = pokemonDataList; // Establece la lista a mostrar
      isLoading = false; // Detiene la pantalla de carga
    });
  }

  void filterSearch(String query) {
    List<Pokemon> searchList = allPokemons.where((pokemon) {
      return pokemon.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      displayedPokemons =
          searchList; // Actualiza la lista mostrada con los resultados de búsqueda
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        iconTheme: const IconThemeData(
          color:
              Colors.white, 
        ),
        searchBackgroundColor: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Buscar Pokémon',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onSearch: (value) => filterSearch(value),
      ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor:Colors.blueGrey,
                    color: Colors.blueGrey[300]
                  ),
                  SizedBox(height: 10),
                  Text('Pokémon obtenidos: $loadedPokemonCount/150'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: displayedPokemons.length,
              itemBuilder: (context, index) {
                return CardSearch(pokemon: displayedPokemons[index]);
              },
            ),
    );
  }
}
