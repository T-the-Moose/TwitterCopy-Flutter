import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter/tweet.dart';

class SingleTweetPage extends StatefulWidget {
  const SingleTweetPage({super.key});

  @override
  _SingleTweetPageState createState() => _SingleTweetPageState();
}

class _SingleTweetPageState extends State<SingleTweetPage> {
  List<Tweet> _tweets = [];

  void callApi() async {
    var response = await http.get(Uri.parse('https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json'));

    if (response.statusCode == 200) {
      setState(() {
        _tweets = List<Tweet>.from(jsonDecode(response.body).map((data) => Tweet.fromJson(data)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Tweet tweet = ModalRoute.of(context)!.settings.arguments as Tweet;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page de tweet seul'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK2nG24AYDm6FOEC7jIfgubO96GbRso2Xshu1f8abSYQ&s",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(tweet.author, style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(tweet.getFormattedDate()),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tweet.message,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: IconButton(
                                onPressed: () {  },
                                icon: Icon(Icons.remove_red_eye),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: IconButton(
                                onPressed: () {  },
                                icon: Icon(Icons.add_comment),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: IconButton(
                                onPressed: () {  },
                                icon: Icon(Icons.forward_outlined),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}