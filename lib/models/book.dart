class Book {
  final int rank;
  final int rankLastWeek;
  final int weeksOnList;
  final String primaryIsbn10;
  final String primaryIsbn13;
  final String publisher;
  final String description;
  final String price;
  final String title;
  final String author;
  final String contributor;
  final String bookImage;
  final int bookImageWidth;
  final int bookImageHeight;
  final String amazonProductUrl;

  Book({
    required this.rank,
    required this.rankLastWeek,
    required this.weeksOnList,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.publisher,
    required this.description,
    required this.price,
    required this.title,
    required this.author,
    required this.contributor,
    required this.bookImage,
    required this.bookImageWidth,
    required this.bookImageHeight,
    required this.amazonProductUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      rank: json['rank'] ?? 0,
      rankLastWeek: json['rank_last_week'] ?? 0,
      weeksOnList: json['weeks_on_list'] ?? 0,
      primaryIsbn10: json['primary_isbn10'] ?? '',
      primaryIsbn13: json['primary_isbn13'] ?? '',
      publisher: json['publisher'] ?? 'Unknown Publisher',
      description: json['description'] ?? 'No description available',
      price: json['price'] ?? '0.00',
      title: json['title'] ?? 'Unknown Title',
      author: json['author'] ?? 'Unknown Author',
      contributor: json['contributor'] ?? '',
      bookImage: json['book_image'] ?? 'https://via.placeholder.com/150',
      bookImageWidth: json['book_image_width'] ?? 150,
      bookImageHeight: json['book_image_height'] ?? 150,
      amazonProductUrl: json['amazon_product_url'] ?? '',
    );
  }
}
