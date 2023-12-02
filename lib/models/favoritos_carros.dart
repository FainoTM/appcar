import 'package:car/models/carro.dart';
import 'package:flutter/material.dart';

class FavoritosCarros with ChangeNotifier {
  Set<Carro> _favoritos = {};

  Set<Carro> get carros => _favoritos;

  void toggleFavorite(Carro carro) {
    if (_favoritos.contains(carro)) {
      _favoritos.remove(carro);
    } else {
      _favoritos.add(carro);
    }
    notifyListeners();
  }

  bool isFavorite(Carro carro) {
    return _favoritos.contains(carro);
  }
}
