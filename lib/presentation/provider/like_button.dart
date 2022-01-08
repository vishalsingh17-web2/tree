import 'package:flutter/cupertino.dart';
import 'package:tree/Models/card_model.dart';

class LikeButtonProvider with ChangeNotifier {
  List<CardModel> cardList;
  LikeButtonProvider({required this.cardList});

  void toggleLike({required int index}) {
    cardList[index].isLiked = !cardList[index].isLiked;
    if (cardList[index].isLiked) {
      cardList[index].likes = cardList[index].likes + 1;
    } else {
      cardList[index].likes =cardList[index].likes == 0 ? 0 : cardList[index].likes - 1;
    }
    notifyListeners();
  }


}
