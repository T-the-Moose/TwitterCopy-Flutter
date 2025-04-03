import 'package:flutter/material.dart';
import 'package:twitter/tweet.dart';

class TweetButton extends StatelessWidget {
  String label;

  TweetButton(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center));
  }
}

class ContentBody extends StatefulWidget {

  late List<Tweet> tweets;

  ContentBody(this.tweets);

  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {

  @override
  Widget build(BuildContext context) {

    // Tri des tweets par date
    widget.tweets.sort((a, b) => b.created_date.compareTo(a.created_date));

    void _goToSinglePage(BuildContext context, Tweet tweet) {
      Navigator.pushNamed(
          context,
          '/pageSingleTweet',
          arguments: tweet,
      );
    }

    return Column(
      children: [
        //Text('Ceci est un élement texte'),
        Expanded(
          child: ListView.builder(
            itemCount: widget.tweets.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
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
                                  child: Text(widget.tweets[index].author, style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(widget.tweets[index].getFormattedDate()),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${widget.tweets[index].message} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                                    onPressed: () => _goToSinglePage(context, widget.tweets[index]),
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
    );
  }
}
