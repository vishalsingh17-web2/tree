class CommentModel {
  String profileUrl;
  String name;
  String date;
  String comment;
  bool isLiked;
  bool isReply;
  int likes;
  bool reply;

  CommentModel({
    required this.profileUrl,
    required this.name,
    required this.date,
    required this.comment,
    required this.isLiked,
    required this.isReply,
    required this.likes,
    required this.reply,
  });
}
