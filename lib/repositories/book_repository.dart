import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:top_books_website_asif/models/book.dart';

class BookRepository {
  final String apiKey = 'amYHskkrauFNbmrf3csL5Nn4CDL77ZNX';

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(
      Uri.parse('https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List books = jsonResponse['results']['books'] ?? [];
      return books.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
