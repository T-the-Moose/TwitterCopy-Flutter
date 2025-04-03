import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter/tweet.dart';

class TweetApiPage extends StatefulWidget {
  const TweetApiPage();

  @override
  State<TweetApiPage> createState() => TweetApiPageState();
}

class TweetApiPageState extends State<TweetApiPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Appel API'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: callApi,
            child: Text('Rafraichir'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tweets.length,
              itemBuilder: (BuildContext context, int index) {
                final tweet = _tweets[index];
                return Card(
                  child: Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Image.network(
                            tweet.profil,
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
                                  "${tweet.message} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}