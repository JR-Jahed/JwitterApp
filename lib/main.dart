import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwitter/constants.dart';
import 'package:jwitter/user_profile.dart';
import 'package:jwitter/username_login_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_tweet.dart';
import 'data/user.dart';
import 'home.dart';
import 'login.dart';
import 'routes.dart';
import 'create_account.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final sp = await SharedPreferences.getInstance();
  final user = sp.getString(loggedInUser);

  var userObject;

  if(user != null) {
    final json = jsonDecode(user);
    userObject = User.fromJson(json);
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(UsernameLoginButton(userObject)),

        routes: {
          homeRoute: (context) => MyHomePage(null),
          createAccountRoute: (context) => CreateAccount(),
          loginRoute: (context) => Login(),
          userProfileRoute: (context) => const UserProfile(),
          createTweetRoute: (context) => CreateTweet(),
        },
      ),
    ),
  );
}
