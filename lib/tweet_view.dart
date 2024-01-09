import 'package:flutter/material.dart';
import 'tweet.g.dart';

class TweetView extends StatelessWidget {
  const TweetView({
    super.key,
    required this.tweet,
  });

  final Tweet tweet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet View'),
      ),
      body: ListTile(
        title: Text(tweet.message),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTime.fromMillisecondsSinceEpoch(tweet.dateTime).toString(),
            ),
            Text('UserID:${tweet.userId}')
          ],
        ),
      ),
    );
  }
}
