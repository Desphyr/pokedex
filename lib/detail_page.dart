import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/shared/widget/pokemon_card_widget.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    
    return Scaffold(
      backgroundColor: Color(0xFFF5FBFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5FBFB),
        title: Text(
          pokemon.name,
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
              pokemon.id.toString().padLeft(3, '0'),
              style: TextStyle(fontSize: 20, color: Color(0xFF3C414F)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: PokemonCardWidget(
              imageUrl: pokemon.imageUrl,
              name: pokemon.name,
              type: pokemon.type,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
