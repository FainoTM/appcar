import 'package:car/models/carro.dart';
import 'package:car/models/favoritos_carros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageFavoritos extends StatefulWidget {
  const PageFavoritos({Key? key}) : super(key: key);

  @override
  State<PageFavoritos> createState() => _PageFavoritosState();
}

class _PageFavoritosState extends State<PageFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritosCarros>(
      builder: (context, favoritosCarros, child) {
        List<Carro> favoritedCars = favoritosCarros.carros.toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text("Favoritos: ${favoritedCars.length}"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoritedCars.length,
                itemBuilder: (context, index) {
                  Carro carro = favoritedCars[index];
                  return ListTile(
                    title: Text(carro.modelo),
                    subtitle: Text(carro.marca),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
