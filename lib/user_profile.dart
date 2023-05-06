import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwitter/providers/logged_in_user_provider.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final user = ref.read(loggedInUserProvider.notifier).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              user!.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            Text(
              user.address == null ? "" : user.address!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

}