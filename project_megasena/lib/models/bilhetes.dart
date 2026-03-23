class bilhete{
  final String dataSorteio;   
  final List<int> numeros;

  bilhete({
    required this.dataSorteio,  //metodo construtor
    required this.numeros,
  });

  factory bilhete.fromJson(Map<String, dynamic> json){
    return bilhete(
      dataSorteio: json['data_Sorteio'] ?? 'Data desconhecida',   //uma funçao para api, já que a maioria returna um arquivo .json
      numeros: List<int>.from(json['numeros'] ?? []),
    );
  }
}