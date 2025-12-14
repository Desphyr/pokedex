
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PokemonContainerWidget extends StatelessWidget {
  final Widget child;
  final String type;

  const PokemonContainerWidget({
    super.key,
    required this.child,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == 'Grass'
            ? Color(0xFFC2E5D5)
            : type == 'Fire'
            ? Color(0xFFEBBCB5)
            : type == 'Water'
            ? Color(0xFFBEDBDD)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class PokemonCardWidget extends StatelessWidget {
  static final _logger = Logger();
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback? onTap;

  const PokemonCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _logger.i('Card tapped: $name');
        if (onTap != null) {
          onTap!();
        }
      },
      child: PokemonContainerWidget(
        type: type,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 100, width: 100),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF223345),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Type: $type',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
