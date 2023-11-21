import 'package:flutter/material.dart';

class DispCarros extends StatefulWidget {
  const DispCarros({super.key});

  @override
  State<DispCarros> createState() => _DispCarrosState();
}

class _DispCarrosState extends State<DispCarros> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(195, 194, 254, 1),
        ),
        width: 330,
        height: 126,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 40, 0),
              child: Column(
                children: [
                  Text(
                    'Carros disponíveis',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                    child: Text(
                      'Confira a lista completa',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: GestureDetector(
                onTap: () {
                  // Adicione ação ao pressionar o botão de seta aqui.
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
