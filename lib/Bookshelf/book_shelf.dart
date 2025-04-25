//archivo de estante para guardar los libros favoritos

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:kola_library_app/models/book.dart';
import 'package:kola_library_app/states/book_shelf_state.dart';

class Bookshaelf extends StatelessWidget {
  const Bookshaelf({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookShaelfBloc, BookShelfState>(
      builder: (contex, bookshelfstate) {
        if (bookshelfstate.bookIds.isEmpty) {
          return Center(
            child: Text(
              " Your Bookshelf is Empty Now",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
            itemCount: bookshelfstate.bookIds.length,
            itemBuilder: (context, index) {
              return BookCoverImageItem(bookshelfstate.bookIds[index]);
            },
          ),
        );
      },
    );
  }
}

class BookCoverImageItem extends StatelessWidget {
  final int _bookId;
  const BookCoverImageItem(this._bookId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Book ID: $_bookId");
    //InkWell(
    //onTap: () {},
    //child: Ink.image(fit: BoxFit.cover, image: AssetImage(_book.coverUrl)),
    //);
  }
}
