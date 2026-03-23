// Teste básico de widget do Flutter atualizado para o nosso app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_megasena/main.dart'; // Importa o arquivo principal do seu app

void main() {
  testWidgets('Teste de carregamento da Tela Inicial', (WidgetTester tester) async {
    // Constrói o nosso aplicativo usando a classe correta que criamos.
    await tester.pumpWidget(const MeuAppLoteria());

    // Como removemos o contador antigo, vamos testar se a nossa nova
    // tela carregou corretamente procurando pelo título da AppBar.
    expect(find.text('Meus Bilhetes'), findsOneWidget);
    
    // Verifica que o texto antigo do contador não existe mais.
    expect(find.text('0'), findsNothing);
  });
}