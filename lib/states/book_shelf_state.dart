// no almacenara el libro como tal porque puede contener bastantes datos
// pero si podemos almacenarlos por medio de su ID

import 'package:flutter_bloc/flutter_bloc.dart';

class BookShelfState {
  // lo almacenaremos por medio de una lista de tipo int este seria nuestro state
  List<int> bookIds;
  BookShelfState(this.bookIds);
}

// vamos a crear los eventos que os permitiran reerencialos mas facilmente
// estos los provee bloc asi que a darle

abstract class BookShelfEvent {
  const BookShelfEvent();
}

//evento add
class AddBookInShelf extends BookShelfEvent {
  final int bookId;
  const AddBookInShelf(this.bookId);
}

//evento remove
class RemoveBookInshelf extends BookShelfEvent {
  final int bookId;
  const RemoveBookInshelf(this.bookId);
}

// agrgando el bloc que escuchara el block
class BookShaelfBloc extends Bloc<BookShelfEvent, BookShelfState> {
  BookShaelfBloc(super.initialState) {
    on<AddBookInShelf>((event, emit) {
      state.bookIds.add(event.bookId);
      emit(BookShelfState(state.bookIds));
    });
    on<RemoveBookInshelf>((event, emit) {
       state.bookIds.remove(event.bookId);
      emit(BookShelfState(state.bookIds));
    });
  }
}
