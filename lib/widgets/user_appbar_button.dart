import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/main.dart';
import 'package:meu_gabarito/widgets/user_profile_image.dart';

class UserAppbarButton extends StatelessWidget {
  const UserAppbarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Tooltip(
        message: "Seu perfil",
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          ),
          child: const UserProfileImage(),
        ),
      ),
    );
  }
}
