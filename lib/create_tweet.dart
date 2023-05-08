import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jwitter/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'data/user.dart';

class CreateTweet extends StatelessWidget {
  CreateTweet({Key? key}) : super(key: key);

  final textController = TextEditingController();

  Future<void> sendData(final context) async {

    String endpoint = "http://10.0.2.2:8000/create_tweet/";

    try {

      final sp = await SharedPreferences.getInstance();
      final user = sp.getString(loggedInUser);

      User userObject;

      if(user == null) {
        return;
      }

      final json = jsonDecode(user);
      userObject = User.fromJson(json);

      Response response = await post(
          Uri.parse(endpoint),
          body: {
            'content': textController.text,
            'user_id': userObject.id.toString(),
            'image': null.toString()
          }
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Tweet created successfully !!!',
            ),
          ),
        );

        Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'An error occurred line 34',
            ),
          ),
        );
      }
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'An error occurred !!!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Tweet'
        ),
      ),

      body: SingleChildScrollView(
        child: Column(

          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: .5,
                color: Colors.black38,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textController,
                maxLines: 20,
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: .5,
              color: Colors.black38,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  sendData(context);
                },
                child: const Text(
                  'Tweet',
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
