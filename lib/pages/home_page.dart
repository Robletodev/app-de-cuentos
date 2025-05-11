import 'package:flutter/material.dart';
import 'package:kola_library_app/book_details/book_details.dart';
import 'package:kola_library_app/models/book.dart';
import 'package:kola_library_app/services/book_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _getLastBooks();
  }

  Future<void> _getLastBooks() async {
    // este metodo se encargara de traer nuestros libros del server
    var lastBook = await BookServices().getLastBooks();
    setState(() {
      _books = lastBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showCircularProgress = _books.isEmpty;
    var listLength = showCircularProgress ? 3 : _books.length + 2;
    return Container(
      margin: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: listLength,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Headerwidget();
          }

          if (index == 1) {
            return ListItemHeader();
          }
          if (showCircularProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return ListItemBook(_books[index - 2]);
        },
      ),
    );
  }
}

class Headerwidget extends StatelessWidget {
  const Headerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/img/k2.png'),
    );
  }
}

// crearemos una clase para darle estilo a la cabecera
class ListItemHeader extends StatelessWidget {
  const ListItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 5),
      child: Text(
        'Last Book',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ListItemBook extends StatelessWidget {
  final Book _book;
  const ListItemBook(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {
            ///--- creando un metodo para los detalles del libro ---///
            _openBookDetails(context, _book);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(_book.coverUrl),
                ),

                ///-- agregando una columna para poner el autor y la descripcion
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          _book.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4),
                      Flexible(child: Text(_book.author)),
                      SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          _book.description,
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBookDetails(BuildContext context, Book book) {
    // iniciamos el metodo de navegacion a la pantalla de detalles del libro
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookdetailScreen(book)),
    );
  }
}
