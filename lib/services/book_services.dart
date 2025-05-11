// esta carpeta o calse tendra todos los request relacionados a los libros y sus llamdas al server

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kola_library_app/models/book.dart';

class BookServices {
  // 1- crearemos una referencia desde lac ual al ser llamada mostrara los libros

  final booksRef = FirebaseFirestore.instance
      .collection('books')
      .withConverter(
        fromFirestore:
            (snapshot, _) => Book.fromJson(snapshot.id, snapshot.data()!),
        toFirestore: (book, _) => book.toJason(),
      );

  //2
  Future<List<Book>> getLastBooks() async {
    var result = await booksRef.limit((3)).get().then((value) => value);
    List<Book> books = [];
    // iteramos dentro de la lista para que puedar circular los documents o archivos que estan cargados en firebase
    for (var doc in result.docs) {
      books.add(doc.data());
    }
    return Future.value(books);
  }

  //3
  Future<Book> getBook(String bookId) async {
    var result = await booksRef.doc(bookId).get().then((value) => value);
    if (result.exists) {
      return Future.value(result.data());
    } else {
      throw HttpException('!!Sorry, Book no found!!');
    }
  }
}
