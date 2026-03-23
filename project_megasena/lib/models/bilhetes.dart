class bilhete{
  final String dataSorteio;
  final List<int> numeros;

  bilhete({
    required this.dataSorteio,
    required this.numeros,
  });

  factory bilhete.fromson(Map<String, dynamic> json){
    return bilhete(
      dataSorteio: json['data_Sorteio'] ?? 'Data desconhecida',
      numeros: List<int>.from(json['numeros'] ?? []),
    );
  }
}