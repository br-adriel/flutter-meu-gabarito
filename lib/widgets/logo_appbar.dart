import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/widgets/user_profile_image.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showUser;
  final bool centerTitle;
  final String title;

  const LogoAppBar({
    super.key,
    this.showUser = true,
    this.centerTitle = false,
    this.title = "meuGabarito",
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: primary),
      title: Text(title),
      centerTitle: centerTitle,
      actions: showUser
          ? [
              Padding(
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
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
