import 'package:flutter/material.dart';
import 'package:kola_library_app/models/book.dart';

// creaciond e la pantalla completa del detalle del libro

class BookdetailScreen extends StatelessWidget {
  final Book _book;
  const BookdetailScreen(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del libro',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverImageWidget(_book.coverUrl), // manejador de la imagen
            //Text(_book.title),
            //Text(_book.author),
            //Text(_book.description),
            BookInfoDetailsWidget(_book.title, _book.author, _book.description),
           Padding(
             padding: const EdgeInsets.only(top: 45),
             child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                ), child: Text('Read Now', style: TextStyle(color: Colors.black),),
              ),
           ),
          ],
        ),
      ),
    );
  }
}


/// como la imagen al cargarla es demasiada grande sera necesario
/// crear una clase por aparte par manejarla esta clase es un widget

class BookCoverImageWidget extends StatelessWidget {
  final String _coverUrl;

  const BookCoverImageWidget(this._coverUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey.withAlpha(1),
          spreadRadius: 5,
          blurRadius: 20
        )]
      ),
      child: Image.asset(_coverUrl),
      );
      
  }
}

class BookInfoDetailsWidget extends StatelessWidget {

  final String title;
  final String author;
  final String  description;

  const BookInfoDetailsWidget(
    this.title,
    this.author,
    this.description, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(title, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),),
          SizedBox(height: 5),
          Text(author, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )),
          SizedBox(height: 20),
          Text(description, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),),
        ],
      ),
    );
  }
}