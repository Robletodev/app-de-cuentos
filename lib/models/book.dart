// crean el modelo de la clase libro

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String coverUrl;

  Book(this.id, this.title, this.author, this.description, this.coverUrl);

  Book.fromJson(String id, Map<String, dynamic> json)
    : this(
        id,
        json['name'] as String,
        json['author'] as String,
        json['summary'] as String,
        json['coverUrl'] as String,
      );
  // crearemos un metodo para trasformar esta data a Json
  toJason() {
    throw UnimplementedError();
  }

}
