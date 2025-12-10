import 'package:flutter/material.dart';

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
        title: Text('Venusaur'),
      ),
      body: Container(),
    );
  }
}