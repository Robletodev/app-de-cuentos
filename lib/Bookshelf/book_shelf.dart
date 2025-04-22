//archivo de estante para guardar los libros favoritos

import 'package:flutter/material.dart';
import 'package:kola_library_app/models/book.dart';

class Bookshaelf extends StatelessWidget {
  Bookshaelf({super.key});

  //para esta debemos tener una lista de lisbros la cual vamos a importar para usar mas facilmente
  // desde la carpeta de models anteriormente creado
  final List<Book> _book = [
    /**  Book(
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
    ), */
  ];

  @override
  Widget build(BuildContext context) {
    if (_book.isEmpty) {
      return Center(
        child: Text(" Your Bookshelf is Empty Now", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30),
          ),
        );
    }
    return Container(
      margin: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: _book.length,
        itemBuilder: (context, index) {
          return BookCoverImageItem(_book[index]);
        },
      ),
    );
  }
}



class BookCoverImageItem extends StatelessWidget {
  final Book _book;
  const BookCoverImageItem(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink.image(fit: BoxFit.cover, image: AssetImage(_book.coverUrl)),
    );
  }
}
