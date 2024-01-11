import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/firebase_options.dart';
import 'package:meu_gabarito/screens/auth/login.dart';
import 'package:meu_gabarito/screens/home.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/index.dart' as themes;
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _providers = [Provider<MainStore>(create: (_) => MainStore())];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Observer(builder: (context) {
          var store = Provider.of<MainStore>(context);
          if (store.auth.user == null) return const LoginScreen();
          return const HomeScreen();
        }),
        theme: themes.defaultTheme,
      ),
    );
  }
}
