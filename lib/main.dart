import 'package:flutter/material.dart';
import 'package:pigeon_demo/tweet.g.dart';

import 'tweet_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tweetApi = TweetApi();
  final tweet = await tweetApi.getTweet();

  runApp(MyApp(tweet: tweet));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.tweet,
  });

  final Tweet tweet;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TweetView(tweet: tweet),
    );
  }
}
