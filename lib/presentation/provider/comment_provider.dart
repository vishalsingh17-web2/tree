import 'package:flutter/material.dart';
import 'package:tree/Models/comment_model.dart';

class CommentBoxProvider with ChangeNotifier {
  List<CommentModel> commentList;

  CommentBoxProvider({required this.commentList});
  void toggleLike({required int index}) {
    commentList[index].isLiked = !commentList[index].isLiked;
    if (commentList[index].isLiked) {
      commentList[index].likes = commentList[index].likes + 1;
    } else {
      commentList[index].likes =commentList[index].likes == 0 ? 0 : commentList[index].likes - 1;
    }
    notifyListeners();
  }

  void addComment(CommentModel comment) {
    commentList.add(comment);
    notifyListeners();
  }

  void toggleReply({required int index}) {
    commentList[index].reply = !commentList[index].reply;
    notifyListeners();
  }

  void replyComment({required int index, required CommentModel comment}) {
    commentList.insert(index, comment);
    notifyListeners();
  }
}
