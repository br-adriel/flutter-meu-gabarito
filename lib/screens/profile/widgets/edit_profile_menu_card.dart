import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/widgets/update_profile_image_bottom_sheet.dart';
import 'package:meu_gabarito/screens/profile/widgets/update_user_name_bottom_sheet.dart';
import 'package:meu_gabarito/widgets/left_align_text_button.dart';

class EditProfileMenuCard extends StatelessWidget {
  const EditProfileMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
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
              builder: (context) => const UpdateProfileImageBottomSheet(),
            ),
            text: "Atualizar imagem de perfil",
          ),
        ],
      ),
    );
  }
}
