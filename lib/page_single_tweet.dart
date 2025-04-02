import 'package:flutter/material.dart';
import 'package:twitter/tweet.dart';

class SingleTweetPage extends StatelessWidget {

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
                            tweet.content,
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