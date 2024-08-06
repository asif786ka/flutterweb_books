import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_books_website_asif/bloc/book_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:top_books_website_asif/models/book.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<BookBloc>().add(FetchBooks());

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Books'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/book', extra: book);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: book.bookImage,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.network(
                            'https://via.placeholder.com/150',
                            fit: BoxFit.cover,
                            height: 180.0,
                            width: 120.0,
                          ),
                          fit: BoxFit.cover,
                          height: 180.0,
                          width: 120.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(book.title, style: TextStyle(fontSize: 16.0)),
                              Text(book.author, style: TextStyle(fontSize: 14.0)),
                              Text(book.publisher, style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load books'));
          }
        },
      ),
    );
  }
}
