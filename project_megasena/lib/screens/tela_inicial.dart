import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/bilhetes.dart';
import '../widgets/cartao_bolinha.dart';
import '../services/gemini_service.dart'; 

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  List<bilhete> meusBilhetes = [
    bilhete(dataSorteio: '25/03/2026', numeros: [4, 12, 25, 33, 41, 58])
  ];

  bool _isCarregando = false;

  // Instanciamos o  serviço do Gemini
  final GeminiService _geminiService = GeminiService();

  Future<void> _lerBilheteComCamera() async {
    final ImagePicker picker = ImagePicker();
    
    // abre a câmera do celular
    final XFile? foto = await picker.pickImage(source: ImageSource.camera);
    
    // se o usuário fechar a câmera sem tirar foto, cancela a ação
    if (foto == null) return;

    // Mostra a bolinha de carregamento na tela
    setState(() {
      _isCarregando = true;
    });

    try {
      // traduzir a foto para bytes
      final bytesDaImagem = await foto.readAsBytes();
      
      //mandando o gemini ler
      final novoBilhete = await _geminiService.lerBilheteDaImagem(bytesDaImagem);

      //usando a ia para ler
      if (novoBilhete != null) {
        setState(() {
          meusBilhetes.add(novoBilhete);
        });
        
        // aviso que deu certo ao usuario
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bilhete lido com sucesso! 🍀'), backgroundColor: Colors.green),
          );
        }
      } else {
        throw Exception("Não foi possível identificar os números.");
      }
    } catch (e) {
      // tratamento de error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao ler bilhete. Tente tirar a foto novamente!'), backgroundColor: Colors.red),
        );
      }
    } finally {
      // esconde a bolinha de carrregamento
      setState(() {
        _isCarregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Bilhetes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: _isCarregando 
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('A Inteligência Artificial está lendo seu bilhete...'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 80),
              itemCount: meusBilhetes.length,
              itemBuilder: (context, index) {
                // para cada bilhete na lista, desenha um cartão
                return CartaoBilhete(Bilhete: meusBilhetes[index]);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _lerBilheteComCamera, // chama a função da câmera
        icon: const Icon(Icons.camera_alt),
        label: const Text('Ler Bilhete'),
      ),
    );
  }
}