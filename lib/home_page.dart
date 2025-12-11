
import 'package:flutter/material.dart';
import 'package:pokedex/detail_page.dart';
import 'package:pokedex/model/dummy_data.dart';
import 'package:pokedex/shared/widget/pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FBFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              headerArea(),
              SizedBox(height: 20),
              searchBar(searchNameController),
              SizedBox(height: 20),
              listPokemon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerArea() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pokédex',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xFF232447),
            ),
          ),
          Text(
            'Search for a Pokémon by name or using its National Pokédex number.',
            style: TextStyle(fontSize: 20, color: Color(0xFF3C414F)),
          ),
        ],
      ),
    );
  }

  Widget searchBar(TextEditingController searchNameController) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: TextFormField(
            controller: searchNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search Pokemon by name or number',
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF5D5E7B),
                size: 30,
              ),
              fillColor: Color(0xFFEBF3F5),
              filled: true,
            ),
          ),
        ),
        Container(
          height: 55,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFF5D5E7B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.filter_list, color: Colors.white),
        ),
      ],
    );
  }



  Widget listPokemon() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = dummyPokemonList[index];
          

          return GestureDetector(
            onTap: () async {
              try {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(pokemon: pokemon),
                  ),
                );
              } catch (e) {
                // menangangani kesalahan navigasi tanpa notifikasi di production
              }
            },
            child: PokemonCardWidget(
              imageUrl: pokemon.imageUrl,
              name: pokemon.name,
              type: pokemon.type,
            ),
          );
        },
      ),
    );
  }
}