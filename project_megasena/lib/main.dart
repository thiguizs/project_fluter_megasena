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
        // Mudar a cor base para azul
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      // chamar tela
      home: const TelaInicial(),
      // Remover a faixa do debug
      debugShowCheckedModeBanner: false, 
    );
  }
}