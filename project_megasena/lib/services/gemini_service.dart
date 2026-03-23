import 'dart:convert';
import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:project_megasena/models/bilhetes.dart';

class GeminiService {

  static const _apiKey = 'AIzaSyAI92Ihfu-YGoQu9I48BuCuCvUyt2LnudE'; 
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash', // O melhor para ler imagens
      apiKey: _apiKey,
    );
  }

  Future<bilhete?> lerBilheteDaImagem(Uint8List bytesDaImagem) async {
    final prompt = TextPart(
        'Analise esta foto de um bilhete da Mega-Sena. '
        'Extraia a data do sorteio e os números apostados. '
        'Retorne APENAS um JSON estrito no seguinte formato, sem formatação markdown: '
        '{"data_sorteio": "DD/MM/AAAA", "numeros": [1, 2, 3, 4, 5, 6]}'
    );
    
    final imagePart = DataPart('image/jpeg', bytesDaImagem);

    try {
      final response = await _model.generateContent([
        Content.multi([prompt, imagePart])
      ]);
      
      final textoResposta = response.text;
      
      if (textoResposta != null) {
        // Limpa possíveis marcações de código do JSON
        final jsonLimpo = textoResposta.replaceAll('```json', '').replaceAll('```', '').trim();
        final Map<String, dynamic> jsonDecodificado = jsonDecode(jsonLimpo);
        
        return bilhete.fromJson(jsonDecodificado);
      }
      return null;
    } catch (e) {
      print('Erro no Gemini: $e');
      return null;
    }
  }
}