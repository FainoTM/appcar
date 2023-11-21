import 'package:car/models/favoritos_carros.dart';
import 'package:car/pages/carro_page.dart';
import 'package:car/pages/favoritos.dart';
import 'package:car/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => FavoritosCarros()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicator: BoxDecoration(
              color: Color.fromRGBO(114, 110, 116, 0.2),
              border:
                  Border(bottom: BorderSide(color: Colors.purple, width: 3))),
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.directions_car_filled,
                color: Colors.black87,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.black87,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            CarPage(),
            PageFavoritos(),
            PagePerfil(),
          ],
        ),
      ),
    );
  }
}
