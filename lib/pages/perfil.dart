import 'dart:convert';

import 'package:car/models/carro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PagePerfil extends StatefulWidget {
  const PagePerfil({super.key});

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  List<Carro> cars = [];

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
          cars = data
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
            cars = [car];
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return ListTile(
            title: Text('${car.marca} ${car.modelo} ${car.ano}'),
            subtitle: Text('Price: ${car.valor}'),
          );
        },
      ),
    );
  }
}
