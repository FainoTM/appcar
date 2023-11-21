import 'package:flutter/material.dart';

class MarcaCarro extends StatefulWidget {
  const MarcaCarro({super.key});

  @override
  State<MarcaCarro> createState() => _MarcaCarroState();
}

class _MarcaCarroState extends State<MarcaCarro> {
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
          height: 218,
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
                    const Spacer(), // Cria um espaço flexível
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Ver todas',
                        style: TextStyle(
                          color: Color.fromARGB(221, 1, 119, 255),
                          fontSize: 15,
                          decoration:
                              TextDecoration.underline, // Adicione sublinhado
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: logos(),
                ),
                Row(
                  children: logos(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> logos() {
    List<Widget> logo = [];
    for (var i = 0; i < 4; i++) {
      Widget contlogo = Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(20)),
          width: 65,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Image.asset('images/acura_logo.png', width: 40, height: 40),
                const Text(
                  'Acura',
                )
              ],
            ),
          ),
        ),
      );
      logo.add(contlogo);
    }
    return logo;
  }
}
