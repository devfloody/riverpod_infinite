
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
}
