import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/widgets/user_appbar_button.dart';

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
      actions: showUser ? [const UserAppbarButton()] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
