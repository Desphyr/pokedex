import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/pokemon_card_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FBFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5FBFB),
        title: Text(
          'Venusaur',
          style: TextStyle(
            color: Color(0xFF232447),
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '003',

              style: TextStyle(fontSize: 20, color: Color(0xFF3C414F)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: PokemonCardWidget(
              imageUrl:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
              name: 'Venusaur',
              type: 'Grass',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
