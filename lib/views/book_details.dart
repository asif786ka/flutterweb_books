import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:top_books_website_asif/models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 300.0,
                width: 200.0,
              ),
              SizedBox(height: 16.0),
              Text(book.title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Author: ${book.author}', style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 8.0),
              Text('Publisher: ${book.publisher}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Description: ${book.description}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Price: ${book.price}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Rank: ${book.rank}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Weeks on list: ${book.weeksOnList}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the buy action, e.g., open the Amazon product URL
                  if (book.amazonProductUrl.isNotEmpty) {
                    //launch(book.amazonProductUrl);
                  }
                },
                child: Text('Buy on Amazon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
