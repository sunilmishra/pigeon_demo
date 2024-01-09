import 'package:pigeon/pigeon.dart';

class Tweet {
  Tweet({
    required this.id,
    required this.message,
    required this.dateTime,
    required this.userId,
  });

  final int id;
  final String message;
  final int dateTime;
  final int userId;
}

@HostApi()
abstract class TweetApi {
  Tweet getTweet();
}
