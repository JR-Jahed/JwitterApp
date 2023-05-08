import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../data/tweet.dart';

class TweetsProvider extends StateNotifier<Tweets?> {

  TweetsProvider(): super(null);

  Future<Tweets> getTweets() async {
    String endpoint = "http://10.0.2.2:8000/get_tweets/";

    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      final tweets = Tweets.fromMap(json);

      return tweets;
    }

    throw Exception(response.reasonPhrase);
  }

  Tweets? get value => state;

  set setUser(Tweets? val) {
    state = val;
  }
}

final tweetsProvider = StateNotifierProvider<TweetsProvider, Tweets?>(
      (ref) => TweetsProvider(),
);