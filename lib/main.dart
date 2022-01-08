import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/presentation/provider/comment_provider.dart';
import 'package:tree/presentation/provider/like_button.dart';
import 'package:tree/presentation/provider/page_view_provider.dart';
import 'data/data.dart';
import 'presentation/Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageViewProvider()),
        ChangeNotifierProvider(create: (context) => LikeButtonProvider(cardList: Data.cardList)),
        ChangeNotifierProvider(create: (context)=> CommentBoxProvider(commentList: CommentData.commentList))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tree',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

