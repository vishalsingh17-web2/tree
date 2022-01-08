import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/presentation/provider/like_button.dart';
import 'package:tree/presentation/provider/page_view_provider.dart';
import 'package:tree/presentation/widgets/bottom_navigation.dart';
import 'package:tree/presentation/widgets/card_widget.dart';
import '../../data/data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageViewProvider, LikeButtonProvider>(
      builder: (context, provider, likeButtonProvider, _) {
        return Scaffold(
          body: [
            ListView.builder(
              itemCount: likeButtonProvider.cardList.length,
              itemBuilder: (context, index) {
                return GetCard(
                  cardModel: likeButtonProvider.cardList[index],
                  index: index,
                );
              },
            ),
            const Center(child: Text('Search')),
            const Center(child: Text('Profile')),
          ][provider.current],
          bottomNavigationBar: getBottomNavBar(
            index: provider.current,
            onTap: provider.currentIndex,
          ),
        );
      },
    );
  }
}
