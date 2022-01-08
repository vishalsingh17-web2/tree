import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/Models/comment_model.dart';
import 'package:tree/presentation/provider/comment_provider.dart';

class CommentBox extends StatelessWidget {
  CommentBoxProvider provider;
  CommentModel comment;
  int index;
  CommentBox(
      {Key? key,
      required this.comment,
      required this.index,
      required this.provider})
      : super(key: key);
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: comment.isReply
              ? const EdgeInsets.only(left: 40)
              : const EdgeInsets.only(left: 0),
          child: ListTile(
            leading: ClipOval(
              child: Image.asset(comment.profileUrl),
            ),
            title: Text(comment.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text(comment.date),
          ),
        ),
        Padding(
          padding: comment.isReply
              ? const EdgeInsets.only(left: 55)
              : const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(comment.comment),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        provider.toggleLike(index: index);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            comment.isLiked
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            size: 15,
                            color: comment.isLiked ? Colors.red : Colors.black,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            comment.likes.toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    !provider.commentList[index].reply
                        ? TextButton(
                            onPressed: () {
                              provider.toggleReply(index: index);
                            },
                            child: const Text('Reply'),
                          )
                        : Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              controller: _commentController,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.cancel,
                                      color: Colors.black),
                                  onPressed: () {
                                    provider.toggleReply(index: index);
                                  },
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (_commentController.text.isNotEmpty) {
                                      provider.replyComment(
                                        index: index+1,
                                        comment: CommentModel(
                                          reply: false,
                                          comment: _commentController.text,
                                          date: '22 sept 2021',
                                          isLiked: false,
                                          isReply: true,
                                          likes: 0,
                                          name: 'You',
                                          profileUrl: 'assets/icons/icon1.png',
                                        ),
                                      );
                                      _commentController.clear();
                                    }
                                  },
                                  icon: Icon(Icons.send),
                                ),
                                hintText: 'reply..',
                                border: InputBorder.none,
                              ),
                              onSubmitted: (value) {
                                if (value.length == 0) return;
                                provider.replyComment(
                                  index: index,
                                  comment: CommentModel(
                                    reply: false,
                                    comment: value,
                                    date: '22 sept 2021',
                                    isLiked: false,
                                    isReply: true,
                                    likes: 0,
                                    name: 'You',
                                    profileUrl: 'assets/icons/icon1.png',
                                  ),
                                );
                                _commentController.clear();
                              },
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
