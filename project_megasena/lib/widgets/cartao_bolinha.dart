import 'package:flutter/material.dart';
import '../models/bilhetes.dart'; // o molde do bilhete
import 'bolinha_numero.dart'; // A bolinha criada

class CartaoBilhete extends StatelessWidget{
  final bilhete Bilhete;

  const CartaoBilhete({super.key, required this.Bilhete});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data do Sorteio: ${Bilhete.dataSorteio}',
              style: const TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: Bilhete.numeros.map((numero){
                return BolinhaNumero(numero: numero);

              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}