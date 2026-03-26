import 'package:flutter/material.dart';
import '../models/bilhetes.dart'; 
import '../widgets/cartao_bolinha.dart'; 

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Criamos um bilhete falso apenas para ver como fica o design
  final bilhete _bilheteTeste = bilhete(
    dataSorteio: '25/03/2026',
    numeros: [4, 12, 25, 33, 41, 58],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Bilhetes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          // Aqui chamamos o cartão e passamos o bilhete de teste
          CartaoBilhete(Bilhete: _bilheteTeste),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          print("Botão de câmera clicado!");
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text('Ler bilhete')),
    );
  }
}