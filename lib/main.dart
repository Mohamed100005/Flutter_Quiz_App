import 'package:flutter/material.dart';
import 'homepage.dart';


void main() {
  runApp(const GetQu());
}

class GetQu extends StatelessWidget {
  const GetQu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

