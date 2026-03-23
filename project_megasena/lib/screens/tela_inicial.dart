import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget{
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();

}

class _TelaInicialState extends State<TelaInicial>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus bilhetes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Nenhum Bilhete Salvo Ainda',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}