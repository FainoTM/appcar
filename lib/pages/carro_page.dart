import 'package:car/pages/carros_disp.dart';
import 'package:car/pages/mais_acessados_carro.dart';
import 'package:car/pages/marcas_carro.dart';
import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black87,
          ),
          title: const Text(
            'InfoCar App',
            style: TextStyle(color: Colors.black87),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                Icons.search,
                color: Colors.black87,
              ),
            )
          ],
          backgroundColor: const Color.fromRGBO(234, 234, 234, 1.0),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              MarcaCarro(),
              DispCarros(),
              MaisAcessados(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
