import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwitter/common/routes.dart';
import 'package:jwitter/providers/tweets_provider.dart';
import 'package:jwitter/widgets/username_login_button.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage(
      this.widget,
      {
      super.key,
    }
  );

  Widget? widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jwitter',
        ),
        actions: [
          widget == null ? UsernameLoginButton(null) : widget!,
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ref.read(tweetsProvider.notifier).getTweets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tweets = snapshot.data!.tweets;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: tweets.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tweets[index].user,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  tweets[index].timestamp.toString(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            tweets[index].content,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Container(
                              height: .5,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(createTweetRoute);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}





















