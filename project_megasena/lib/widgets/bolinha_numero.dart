import 'package:flutter/material.dart';

class BolinhaNumero extends StatelessWidget {
  final int numero;

  const BolinhaNumero({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.green, 
        shape: BoxShape.circle, 
      ),
      child: Center(
        child: Text(
          numero.toString().padLeft(2, '0'), 
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}