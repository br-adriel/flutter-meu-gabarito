import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:provider/provider.dart';

class UserProfileImage extends StatelessWidget {
  final double radius;

  const UserProfileImage({super.key, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<MainStore>(context).auth.user;

    return Observer(
      builder: (context) => CircleAvatar(
        radius: radius,
        backgroundColor: primary[200],
        foregroundColor: primary[50],
        backgroundImage: user != null && user.photoURL != null
            ? NetworkImage(user.photoURL!)
            : null,
        child: user != null && user.photoURL == null
            ? Icon(Icons.person_rounded, size: radius)
            : null,
      ),
    );
  }
}
