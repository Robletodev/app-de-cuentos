// esta carpeta o calse tendra todos los request relacionados a los libros y sus llamdas al server

import 'package:kola_library_app/models/book.dart';

class BookServices {

final List<Book> books = [
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

  Future<List<Book>> getLastBook() async {
    return Future.delayed(const Duration(seconds: 3))
    .then((value) => Future.value(books.sublist(0,2)));
  }

  Future<Book> getBook(int bookId) async {
    return Future.delayed(const Duration(seconds: 3))
    .then((value) => Future.value(
      books.firstWhere((bookElement) => bookElement.id == bookId
    )));
  }
}
