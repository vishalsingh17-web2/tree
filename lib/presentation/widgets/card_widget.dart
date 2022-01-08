import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/Models/card_model.dart';
import 'package:tree/presentation/Screens/post_view.dart';
import 'package:tree/presentation/provider/like_button.dart';

class GetCard extends StatelessWidget {
  CardModel cardModel;
  int index;
  GetCard({Key? key, required this.cardModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  cardModel.profileUrl,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(
                cardModel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(cardModel.date),
              trailing: IconButton(
                  icon: const Icon(Icons.more_vert), onPressed: () {}),
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                image: DecorationImage(
                  image: AssetImage(cardModel.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                cardModel.description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(height: 1),
            Container(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fixedSize: const Size(double.maxFinite, 40),
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    CupertinoPageRoute(
                      builder: (context) => PostView(cardModel: cardModel, index: index,),
                    ),
                  );
                },
                child: Text(
                  "${cardModel.comments} comments",
                  style: TextStyle(color: Colors.grey.shade800),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Divider(height: 1),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<LikeButtonProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          provider.toggleLike(index: index);
                        },
                        child: Column(
                          children: [
                            Icon(
                              provider.cardList[index].isLiked
                                  ? CupertinoIcons.hand_thumbsup_fill
                                  : CupertinoIcons.hand_thumbsup,
                              color: Colors.blue,
                            ),
                            Text(
                              '${provider.cardList[index].likes} likes',
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.share_outlined,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("${cardModel.rating} ⭐"),
                      Text(
                        'Avg rating',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
