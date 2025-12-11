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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF232447)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pokemon.name,
              style: TextStyle(
                color: Color(0xFF232447),
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
            Text(
              pokemon.id.toString().padLeft(3, '0'),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: PokemonCardWidget(
                imageUrl: pokemon.imageUrl,
                name: '',
                type: pokemon.type,
                onTap: () {},
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
