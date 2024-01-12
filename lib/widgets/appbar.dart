import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/utils/route.dart';
import 'package:provider/provider.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showUser;
  final bool centerTitle;

  const DefaultAppbar(
      {super.key, this.showUser = true, this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MainStore>(context).auth;

    return AppBar(
      iconTheme: const IconThemeData(color: primary),
      title: const Text("meuGabarito"),
      titleTextStyle: appBarLogoTextStyle,
      centerTitle: centerTitle,
      actions: showUser
          ? [
              Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.of(context).push(
                    createRouteGoingUp(const ProfileScreen()),
                  ),
                  child: CircleAvatar(
                    backgroundColor: primary[200],
                    foregroundColor: primary[50],
                    backgroundImage: auth.user!.photoURL != null
                        ? NetworkImage(auth.user!.photoURL!)
                        : null,
                    child: auth.user!.photoURL == null
                        ? const Icon(Icons.person_rounded)
                        : null,
                  ),
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
