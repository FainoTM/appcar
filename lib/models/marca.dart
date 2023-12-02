class Marca {
  String code;
  String nome;

  Marca({
    required this.code,
    required this.nome,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('code') && json.containsKey('name')) {
      return Marca(
        code: json['code'],
        nome: json['name'],
      );
    } else {
      throw FormatException('Failed to load carros.');
    }
  }
}
