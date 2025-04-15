class Abastecimento {
  final String data;
  final double km;
  final double litros;
  final double valor;

  Abastecimento({
    required this.data,
    required this.km,
    required this.litros,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'km': km,
      'litros': litros,
      'valor': valor,
    };
  }

  factory Abastecimento.fromMap(Map<String, dynamic> map) {
    return Abastecimento(
      data: map['data'],
      km: map['km'],
      litros: map['litros'],
      valor: map['valor'],
    );
  }
}
