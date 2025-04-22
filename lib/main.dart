import 'package:flutter/material.dart';
import 'package:kola_library_app/Bookshelf/book_shelf.dart';
import 'package:kola_library_app/categorias/categories_screen.dart';
import 'package:kola_library_app/pages/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koala Library',
      home: Scaffold(body: BottonNavigationWidget()),
    );
  }
}

// elaboremos la del bottonNaviationBar
class BottonNavigationWidget extends StatefulWidget {
  const BottonNavigationWidget({super.key});

  @override
  State<BottonNavigationWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  // crearemos una pequeña variable para manejar el estado
  int _seletedIndex = 0;


  /////--- cracion de un listdo para las pantallas---///
  static final List<Widget> _sections = [
    HomePage(),
    BookCategoriesgried(),
    Bookshaelf(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Koala Library',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          height: 45,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.black, Colors.blue],
            ),
          ),
        ),
      ),
      ////// -- creando el bottonNavigationBar ---////
      // esta seria la clase con estado que nos hara pasar a otra pantalla
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: const Color.fromARGB(255, 110, 10, 135),), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library,color: const Color.fromARGB(255, 91, 4, 120)),
            label: 'My Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.auto_stories, color: const Color.fromARGB(255, 112, 6, 141),), label: 'My Bookshelf'),
        ],
        // integremos la variable de manejador de estado
        currentIndex: _seletedIndex,
        onTap: _onTapped,
      ),
      /////// -- creando el  body de las pantallas ---/////
      body: _sections[_seletedIndex],
    );
  }

  void _onTapped(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }
}
