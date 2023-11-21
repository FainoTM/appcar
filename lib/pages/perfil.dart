import 'package:car/models/carro.dart';
import 'package:car/models/favoritos_carros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagePerfil extends StatefulWidget {
  const PagePerfil({Key? key}) : super(key: key);

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Carro carro = Carro(
          modelo: "Onix",
          marca: 'Chevrolet',
          valor: 50000,
          descricao: 'Carro Popular',
          imgUrl: '/',
        );
        Provider.of<FavoritosCarros>(context, listen: false).add(carro);
      },
      child: Text('Página Perfil'),
    );
  }
}
