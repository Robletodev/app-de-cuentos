import 'package:flutter/material.dart';
import 'package:kola_library_app/book_details/book_details.dart';
import 'package:kola_library_app/models/book.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //// ---- craaremos un arreglo para obtener loslibros de internet
  final List<Book> _books = [
    Book(
      1,
      'El Principito',
      'Antoine de Saint-Exupéry',
      'El principito es un texto escrito en el año de 1943 por el escritor frances Antoine de Saint-Exupéry, que relata la historia ficticia de un aviador y un niño que proviene de otro planeta; el cual podemos ver representa una realidad infantil con increíble creatividad en él y optimismo frente a la realidad que enfrenta.',
      "assets/img/prince.jpg",
    ),
    Book(
      2,
      'La Tortuga y la Liebre',
      'Eric Carle',
      'Érase una vez una tortuga y un conejo que discutían sobre quién era más rápido. Pronto terminó la carrera, erigiéndose como el campeón indiscutible. El conejo despertó y se dio cuenta de que había perdido la carrera. La moraleja de la historia es que despacio y con constancia se gana la carrera',
      'assets/img/tyl.jpg',
    ),
    Book(
      2,
      'JacK y las abichuelas magicas',
      'Fernando Flein',
      'Jack se embarcara en la mas grande de sus aventuras y descubrira un mundo magico llenos de peligros y valiosos tesoros junto a sus amigos se volvera una leyenda cazando gigantes y conquistando el corazon de la princesa de su reino',
      'assets/img/jack.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: _books.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Headerwidget();
          }

          if (index == 1) {
            return ListItemHeader();
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
      child: Image.asset('assets/img/hed3.png'),
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
      MaterialPageRoute(builder: (context) => BookdetailScreen(book))
       );
  }
}
