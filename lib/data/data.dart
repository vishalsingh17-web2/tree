import 'package:flutter/material.dart';
import 'package:tree/Models/card_model.dart';
import 'package:tree/Models/comment_model.dart';
import 'package:tree/presentation/widgets/card_widget.dart';

class Data{
  static List<CardModel> cardList = [
    CardModel(
      isLiked: false,
      profileUrl: 'assets/icons/icon.png',
      name: 'Roy',
      date: '22 september 2021',
      imageUrl: 'assets/images/imag.jpg',
      comments: 10,
      likes: 6,
      description:
          'A collision of sci-fi, drama and horror, "Before I Fall" earns points for ambition.',
      rating: 4.1,
    ),
    CardModel(
      isLiked: false,
      profileUrl: 'assets/icons/icon_two.png',
      name: 'Tim',
      date: '22 september 2021',
      imageUrl: 'assets/images/imag_two.jpg',
      comments: 10,
      likes: 12,
      description:
          '1917 is riveting as well as an exhilarating experience. It is one of the best war films ever made.',
      rating: 4.1,
    ),
  ];
}

class CommentData{
  static List<CommentModel> commentList = [
    CommentModel(
      comment: 'Would definitely watch it!',
      profileUrl: 'assets/icons/com.png',
      date: '22 september 2021',
      name: 'Tada',
      isLiked: true,
      likes: 2,
      isReply: false,
      reply: false
    ),
    CommentModel(
      comment: 'Me too!',
      date: '22 september 2021',
      profileUrl: 'assets/icons/com_two.png',
      name: 'Liam',
      isLiked: false,
      likes: 0,
      isReply: true,
      reply: false

    ),
    CommentModel(
      comment: 'Nice',
      date: '22 september 2021',
      profileUrl: 'assets/icons/com_three.png',
      name: 'Amy',
      isLiked: false,
      likes: 0,
      isReply: false,
      reply: false

    ),
    CommentModel(
      comment: 'Good',
      date: '22 september 2021',
      profileUrl: 'assets/icons/com_four.png',
      name: 'Sara',
      isLiked: false,
      likes: 0,
      isReply: false,
      reply: false

    ),
    CommentModel(
      comment: 'Will try',
      date: '22 september 2021',
      profileUrl: 'assets/icons/com_five.png',
      name: 'Bella',
      isLiked: false,
      likes: 0,
      isReply: false,
      reply: false

    ),
    CommentModel(
      comment: 'Average movie',
      date: '22 september 2021',
      profileUrl: 'assets/icons/com_six.png',
      name: 'Issa',
      isLiked: false,
      likes: 0,
      isReply: false,
      reply: false

    ),
  ];
}