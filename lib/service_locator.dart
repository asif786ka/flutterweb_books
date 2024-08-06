import 'package:get_it/get_it.dart';
import 'package:top_books_website_asif/repositories/book_repository.dart';

// Initialize Get It
final GetIt getIt = GetIt.instance;

// Register services and repositories
void setup() {
  getIt.registerLazySingleton(() => BookRepository());
}
