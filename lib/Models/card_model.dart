class CardModel {
  bool isLiked;
  String profileUrl;
  String name;
  String date;
  String imageUrl;
  String description;
  int likes;
  int comments;
  double rating;

  CardModel({
    required this.isLiked,
    required this.profileUrl,
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.comments,
    required this.rating,
  });
}

