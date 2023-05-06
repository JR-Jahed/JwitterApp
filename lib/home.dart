import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:jwitter/providers/logged_in_user_provider.dart';
import 'package:jwitter/routes.dart';
import 'package:jwitter/username_login_button.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage(
      this.widget,
      {
      super.key,
    }
  );

  Widget? widget;

  Future<String> getData() async {
    String endpoint = "http://10.0.2.2:8000/get_users/";

    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      // print(response.body);
    }
    else {
      print("error");
    }

    return response.body;
  }

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
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
