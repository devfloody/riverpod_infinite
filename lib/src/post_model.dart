// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  String title;
  String body;
  String author;
  double rating;

  Post({
    required this.title,
    required this.body,
    required this.author,
    required this.rating,
  });

  @override
  String toString() {
    return 'Post(title: $title, body: $body, author: $author, rating: $rating)';
  }

  Post copyWith({
    String? title,
    String? body,
    String? author,
    double? rating,
  }) {
    return Post(
      title: title ?? this.title,
      body: body ?? this.body,
      author: author ?? this.author,
      rating: rating ?? this.rating,
    );
  }
}
