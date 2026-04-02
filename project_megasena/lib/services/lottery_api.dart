import 'dart:convert';
import 'package:http/http.dart' as http;

class LotteryApi {
  // Api das loterias da caixa econimica federal
  final String _baseUrl = 'https://loteriascaixa-api.herokuapp.com/api/megasena';

  // buscar o ultimo sorteio
  Future<Map<String, dynamic>?> buscarUltimoResultado() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/latest'));

      if (response.statusCode == 200) {
        // caso funcione, transforma em json
        final json = jsonDecode(response.body);
        
        return {
          'concurso': json['concurso'],
          'data': json['data'],
          // a api vai me devolver string e aqui transformo em interiro
          'dezenas': (json['dezenas'] as List).map((n) => int.parse(n)).toList(), 
          'acumulou': json['acumulou'],
        };
      } else {
        print('Erro na API da Loteria: Código ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Erro ao buscar resultado da loteria: $e');
      return null;
    }
  }
}