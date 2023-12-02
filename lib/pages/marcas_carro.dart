import 'dart:convert';

import 'package:car/models/marca.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarcaCarro extends StatefulWidget {
  const MarcaCarro({Key? key}) : super(key: key);

  @override
  State<MarcaCarro> createState() => _MarcaCarroState();
}

class _MarcaCarroState extends State<MarcaCarro> {
  late Future<List<Marca>> futureMarcas;

  @override
  void initState() {
    super.initState();
    futureMarcas = fetchMarca();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(234, 234, 234, 1.0),
          ),
          width: 330,
          height: 268,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Marcas',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        print(futureMarcas.toString());
                      },
                      child: const Text(
                        'Ver todas',
                        style: TextStyle(
                          color: Color.fromARGB(221, 1, 119, 255),
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder<List<Marca>>(
                  future: futureMarcas,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final marcas = snapshot.data!;
                      final firstRow = marcas.take(22).toList();
                      final secondRow = marcas.skip(22).toList();

                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: logos(firstRow),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: logos(secondRow),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Marca>> fetchMarca() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v2/cars/brands'));

    if (response.statusCode == 200) {
      final List<dynamic> corpo = jsonDecode(response.body);
      final List<Marca> marcas =
          corpo.map((marcaJson) => Marca.fromJson(marcaJson)).toList();
      return marcas;
    } else {
      throw Exception('Failed to load marcas');
    }
  }

  List<Widget> logos(List<Marca> marcas) {
    return marcas
        .map((marca) => Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20)),
                  width: 65,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/acura_logo.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(marca.nome),
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
