class Carro {
  String modelo;
  String marca;
  String valor;
  int ano;

  Carro({
    required this.modelo,
    required this.marca,
    required this.valor,
    required this.ano,
  });

  factory Carro.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('brand') &&
        json.containsKey('model') &&
        json.containsKey('modelYear') &&
        json.containsKey('price')) {
      return Carro(
        marca: json['brand'],
        modelo: json['model'],
        ano: json['modelYear'],
        valor: json['price'],
      );
    } else {
      throw FormatException('Failed to load carros.');
    }
  }
}
