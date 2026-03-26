import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/tela_inicial.dart'; // Importando a nossa tela


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // Carrega o cofre
  
  runApp(const MeuAppLoteria());
}

class MeuAppLoteria extends StatelessWidget {
  const MeuAppLoteria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega-Sena IA',
      theme: ThemeData(
        // Mudamos a cor base para verde, que combina mais com loteria!
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      // Aqui dizemos qual é a primeira tela do app
      home: const TelaInicial(),
      // Remove aquela faixa vermelha de "DEBUG" no canto da tela
      debugShowCheckedModeBanner: false, 
    );
  }
}