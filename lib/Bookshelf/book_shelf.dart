//archivo de estante para guardar los libros favoritos

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kola_library_app/book_details/book_details.dart';
import 'package:kola_library_app/models/book.dart';
import 'package:kola_library_app/services/book_services.dart';
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

class BookCoverImageItem extends StatefulWidget {
  final int _bookId;
  const BookCoverImageItem(this._bookId, {super.key});

  @override
  State<BookCoverImageItem> createState() => _BookCoverImageItemState();
}

class _BookCoverImageItemState extends State<BookCoverImageItem> {
  Book? _book;

  @override
  void initState() {
    super.initState();
    _getBook(widget._bookId);
  }

  void _getBook(int bookId) async {
    var book = await BookServices().getBook(bookId);
    setState(() {
      _book = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_book == null) {
      return Center(child: CircularProgressIndicator());
    }
    return InkWell(
      onTap: () {
        _openBookDetails(_book!, context);
      },
      child: Ink.image(fit: BoxFit.cover, image: AssetImage(_book!.coverUrl)),
    );
  }

  _openBookDetails(Book book, BuildContext context) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => BookdetailScreen(book))
    );
  }
}
