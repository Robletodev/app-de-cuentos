import 'package:flutter/material.dart';
import 'package:kola_library_app/utils.dart';
import 'package:kola_library_app/models/categorias.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookCategoriesgried(); // creado por aparte para poder ser reutilizado
  }
}

class BookCategoriesgried extends StatelessWidget {
  BookCategoriesgried({super.key});

  // una ves creado el modelo de las categorias vamos a implementarlo

  final List<BookCategory> _categories = [
    BookCategory(1, 'Sleep Tiles', '#5dade2'),
    BookCategory(2, 'Aventure Tiles', '#ec7063 '),
    BookCategory(3, 'Fast Learning', '#d35400'),
    BookCategory(4, 'Fantasy Tiles', '#c39bd3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return TileCategory(_categories[index]);
        },
      ),
    );
  }
}

class TileCategory extends StatelessWidget {
  final BookCategory _category;

  const TileCategory(this._category, {super.key, Key? keys});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // creado el punto de navegacion a los detalles del libro
          _navigationToBookwithcategory();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hexaToColor(_category.colorBg),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            _category.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

void _navigationToBookwithcategory(
  /**BookCategory category*/
) {}
