import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/widgets/update_profile_image_bottom_sheet.dart';
import 'package:meu_gabarito/screens/profile/widgets/update_user_name_bottom_sheet.dart';
import 'package:meu_gabarito/screens/profile/widgets/user_info.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/widgets/left_align_text_button.dart';
import 'package:meu_gabarito/widgets/logout_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    return Scaffold(
      appBar: AppBar(title: const Text("Seu perfil")),
      body: auth.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const UserInfo(),
                  LeftAlignTextButton(
                    onPressed: () => showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const UpdateUserNameBottomSheet(),
                    ),
                    text: "Alterar nome",
                  ),
                  LeftAlignTextButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          const UpdateProfileImageBottomSheet(),
                    ),
                    text: "Atualizar imagem de perfil",
                  ),
                  LeftAlignTextButton(
                    onPressed: () {},
                    text: "Atualizar email",
                  ),
                  LeftAlignTextButton(onPressed: () {}, text: "Alterar senha"),
                  const LogoutButton(),
                ],
              ),
            ),
    );
  }
}
