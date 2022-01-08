import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/Models/card_model.dart';
import 'package:tree/Models/comment_model.dart';
import 'package:tree/presentation/provider/comment_provider.dart';
import 'package:tree/presentation/provider/like_button.dart';
import 'package:tree/presentation/widgets/card_widget.dart';
import 'package:tree/presentation/widgets/comment_box.dart';

class PostView extends StatefulWidget {
  CardModel cardModel;
  int index;
  PostView({Key? key, required this.cardModel, required this.index})
      : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentBoxProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: CustomScrollView(
            
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      GetCard(cardModel: widget.cardModel, index: widget.index),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == provider.commentList.length - 1) {
                      return Column(
                        children: [
                          CommentBox(
                            provider: provider,
                            comment: provider.commentList[index],
                            index: index,
                          ),
                          const SizedBox(height: 60)
                        ],
                      );
                    }
                    return CommentBox(
                      provider: provider,
                      comment: provider.commentList[index],
                      index: index,
                    );
                  },
                  childCount: provider.commentList.length,
                ),
              ),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      provider.addComment(
                        CommentModel(
                          reply: false,
                          comment: _commentController.text,
                          date: '22 sept 2021',
                          isLiked: false,
                          isReply: false,
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
                hintText: 'Add Comment',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                if (value.length == 0) return;
                provider.addComment(
                  CommentModel(
                    reply: false,
                    comment: value,
                    date: '22 sept 2021',
                    isLiked: false,
                    isReply: false,
                    likes: 0,
                    name: 'You',
                    profileUrl: 'assets/icons/icon1.png',
                  ),
                );
                _commentController.clear();
              },
            ),
          ),
        );
      },
    );
  }
}
