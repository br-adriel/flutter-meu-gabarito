import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/profile/widgets/authentication_menu_card.dart';
import 'package:meu_gabarito/screens/profile/widgets/edit_profile_menu_card.dart';
import 'package:meu_gabarito/screens/profile/widgets/user_info.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seu perfil"),
        centerTitle: true,
      ),
      body: auth.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserInfo(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Text('Editar perfil'),
                    ),
                    EditProfileMenuCard(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Text('Autenticação'),
                    ),
                    AuthenticationMenuCard(),
                  ],
                ),
              ),
            ),
    );
  }
}
