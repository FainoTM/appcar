import 'dart:convert';

import 'package:car/models/carro.dart';
import 'package:car/models/favoritos_carros.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MaisAcessados extends StatefulWidget {
  const MaisAcessados({Key? key}) : super(key: key);

  @override
  State<MaisAcessados> createState() => _MaisAcessadosState();
}

class _MaisAcessadosState extends State<MaisAcessados> {
  List<Carro> carros = [];

  @override
  void initState() {
    super.initState();
    fetchCarData();
  }

  Future<void> fetchCarData() async {
    final response = await http.get(Uri.parse(
        'https://parallelum.com.br/fipe/api/v2/cars/brands/1/models/1/years/1992-1'));
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);

      if (data is List) {
        setState(() {
          carros = data
              .map((carJson) {
                try {
                  return Carro.fromJson(carJson);
                } catch (e) {
                  print('Error parsing car JSON: $e');
                  print('Raw JSON: $carJson');
                  return null;
                }
              })
              .whereType<Carro>()
              .toList();
        });
      } else if (data is Map<String, dynamic>) {
        try {
          final Carro car = Carro.fromJson(data);
          setState(() {
            carros = [car];
          });
        } catch (e) {
          print('Error parsing single car JSON: $e');
          print('Raw JSON: $data');
        }
      } else {
        print(
            'Invalid data format. Expected a List or Map, but received: $data');
      }
    } else {
      print('Failed to load car data. Status code: ${response.statusCode}');
      throw Exception('Failed to load car data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(234, 234, 234, 1.0),
      ),
      width: 330,
      height: 206,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 110, 0),
            child: Text(
              'Mais acessados',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listCarros(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> listCarros() {
    return carros.map((carro) {
      return InkWell(
        onTap: () {
          _showCarDetails(context, carro);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 128,
            height: 128,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Image.asset('images/carro_foto.png', width: 90, height: 50),
                  Text(carro.modelo),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Text(
                      carro.marca,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Text(carro.valor),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  void _showCarDetails(BuildContext context, Carro carro) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final favoritosCarros =
            Provider.of<FavoritosCarros>(context, listen: false);

        return Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Detalhes do Carro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset('images/carro_foto.png', width: 150, height: 80),
                SizedBox(height: 16),
                Text(
                  'Model: ${carro.modelo}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Brand: ${carro.marca}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Price: ${carro.valor}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    favoritosCarros.toggleFavorite(carro);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    favoritosCarros.isFavorite(carro)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
