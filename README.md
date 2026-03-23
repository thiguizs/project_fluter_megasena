# project_megasena

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Simulador e Leitor Inteligente - Mega-Sena

Um aplicativo moderno construído em **Flutter** que une a lógica da probabilidade com a **Inteligência Artificial (Gemini)** para criar a melhor experiência em gestão de jogos da Mega-Sena.

## Sobre o Projeto

Este projeto tem dois grandes objetivos:
1. **Garantir a Estatística:** Gerar palpites de jogos garantindo que combinações que já saíram na história da loteria (ou no seu histórico) nunca sejam repetidas.
2. **Facilitar a Vida com IA:** Utilizar visão computacional para ler comprovantes físicos de loteria pela câmera do celular, salvando os números automaticamente e conferindo os resultados.

## Funcionalidades (Roadmap)

- [x] **Interface Base:** Estrutura inicial e listagem de bilhetes em formato de cartões (*Cards*).
- [ ] **Visão Computacional:** Integração com a câmera para capturar imagens de bilhetes físicos.
- [ ] **Leitura Inteligente:** Uso do modelo `gemini-1.5-flash` para extrair datas e números da imagem do bilhete e transformar em dados (`JSON`).
- [ ] **Armazenamento Local:** Salvar os bilhetes escaneados na memória do celular.
- [ ] **Conferência Automática:** Comparar os jogos salvos com os resultados oficiais e notificar acertos (Quadra, Quina ou Sena).

## Tecnologias Utilizadas

* **[Flutter](https://flutter.dev/):** Framework principal para construção da interface de usuário nativa (Android/iOS).
* **[Dart](https://dart.dev/):** Linguagem de programação base.
* **[Google Generative AI](https://pub.dev/packages/google_generative_ai):** Pacote oficial para comunicação com a API do Gemini.
* **[Image Picker](https://pub.dev/packages/image_picker):** (Em breve) Para captura de fotos pela câmera.

## Como executar o projeto

Se você deseja clonar e rodar este projeto na sua máquina, siga os passos abaixo:

1. Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado no seu computador.
2. Clone este repositório.
3. Abra o terminal na pasta raiz do projeto e rode o comando para baixar as dependências:
   flutter pub get

* **Aviso de API: Este projeto utiliza a API do Gemini. Para que a leitura de imagens funcione, você precisará gerar uma chave no Google AI Studio e inseri-la no arquivo lib/services/gemini_service.dart.**

Execute o aplicativo em um emulador ou dispositivo físico:

* ** Execução do projeto **
    flutter run

## Projeto desenvolvido como parte de uma jornada de aprendizado prático em Flutter e Inteligência Artificial.



