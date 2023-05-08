class Tweets {

  Tweets({
    required this.tweets,
  });

  List<Tweet> tweets;

  factory Tweets.fromMap(Map<String, dynamic> json) => Tweets(
    tweets: List<Tweet>.from(json["tweets"].map((x) => Tweet.fromJson(x)))
  );
}


class Tweet {
  int id;
  String content;
  String user;
  DateTime timestamp;

  Tweet({
    required this.id,
    required this.content,
    required this.user,
    required this.timestamp
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
    id: json["id"],
    content: json["content"],
    user: json["user"],
    timestamp: DateTime.parse(json["timestamp"]),
  );
}