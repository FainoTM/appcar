import 'package:flutter/material.dart';

class MaisAcessados extends StatefulWidget {
  const MaisAcessados({super.key});

  @override
  State<MaisAcessados> createState() => _MaisAcessadosState();
}

class _MaisAcessadosState extends State<MaisAcessados> {
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
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listcarros(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> listcarros() {
    List<Widget> carro = [];
    for (var i = 0; i < 8; i++) {
      Widget contcarro = Padding(
        padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(20)),
          width: 128,
          height: 128,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Image.asset('images/carro_foto.png', width: 90, height: 50),
                const Text(
                  'INTEGRA',
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    'Acura',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text('\$31,500+'),
                ),
              ],
            ),
          ),
        ),
      );
      carro.add(contcarro);
    }
    return carro;
  }
}
