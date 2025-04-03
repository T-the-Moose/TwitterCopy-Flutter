import 'package:flutter/material.dart';
import 'package:twitter/content-body.dart';
import 'package:twitter/page_single_tweet.dart';
import 'package:twitter/tweet.dart';
import 'package:twitter/tweet_api.dart';
import 'package:twitter/tweet_form.dart';

void main() {
  runApp(TPTwitterApp());
}

class TPTwitterApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweeter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      initialRoute: '/',
      routes : {
        '/' : (context) => TapBarPage(),
        '/pageSingleTweet' : (context) => SingleTweetPage(),
      },
    );
  }
}

class TapBarPage extends StatelessWidget {

  List<Tweet> tweets = [
    Tweet(1, "profil 1", 'Mon 1er post', 'Fred', DateTime(2023, 5, 1, 12, 45)),
    Tweet(2, "profil 2", 'Salut !', 'Manu', DateTime(2023, 11, 1, 17, 7)),
    Tweet(3, "profil 3", 'Pas d\'accord', 'Géraldine', DateTime(2024, 2, 12, 14, 26)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tweeter'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: Icon(Icons.rocket_launch),
          elevation: 2,
          shadowColor: Colors.black,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.list_outlined)),
              Tab(icon: Icon(Icons.format_color_text_outlined)),
              Tab(icon: Icon(Icons.api_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ContentBody(tweets),
            TweetFormPage(),
            TweetApiPage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 2,
          shadowColor: Colors.black,
          selectedIndex: 0,
          onDestinationSelected: (int index) {},
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
            NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Saved',
            ),
          ],
        ),
      ),
    );
  }

}

