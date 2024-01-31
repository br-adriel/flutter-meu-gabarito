import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:provider/provider.dart';

class UserProfileImage extends StatelessWidget {
  final double radius;

  const UserProfileImage({super.key, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    return Observer(
      builder: (context) => CircleAvatar(
        radius: radius,
        backgroundColor: primary[200],
        foregroundColor: primary[50],
        backgroundImage: auth.user != null && auth.user!.photoURL != null
            ? NetworkImage(auth.user!.photoURL!)
            : null,
        child: auth.user != null && auth.user!.photoURL == null
            ? Icon(Icons.person_rounded, size: radius)
            : null,
      ),
    );
  }
}
