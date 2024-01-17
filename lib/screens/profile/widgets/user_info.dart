import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/widgets/user_profile_image.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<MainStore>(context).auth.user;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserProfileImage(radius: 32),
          const SizedBox(width: 8),
          Observer(
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.displayName ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(user?.email ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
