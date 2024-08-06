import 'package:bloc/bloc.dart';
import 'package:top_books_website_asif/models/book.dart';
import 'package:top_books_website_asif/repositories/book_repository.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<FetchBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await bookRepository.fetchBooks();
        emit(BookLoaded(books: books));
      } catch (e) {
        emit(BookError(message: e.toString()));
      }
    });
  }
}
