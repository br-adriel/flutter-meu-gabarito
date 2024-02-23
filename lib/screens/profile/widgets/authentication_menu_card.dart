import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/widgets/upate_email_bottom_sheet.dart';
import 'package:meu_gabarito/screens/profile/widgets/update_password_bottom_sheet.dart';
import 'package:meu_gabarito/widgets/left_align_text_button.dart';
import 'package:meu_gabarito/widgets/logout_button.dart';

class AuthenticationMenuCard extends StatelessWidget {
  const AuthenticationMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          LeftAlignTextButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const UpdateEmailBottomSheet(),
            ),
            text: "Atualizar email",
          ),
          LeftAlignTextButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const UpdatePasswordBottomSheet(),
            ),
            text: "Alterar senha",
          ),
          const LogoutButton(),
        ],
      ),
    );
  }
}
