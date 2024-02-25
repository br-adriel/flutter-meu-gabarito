import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/screens/gabarito.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/widgets/gabarito_card.dart';
import 'package:meu_gabarito/widgets/logo_appbar.dart';
import 'package:provider/provider.dart';

class GabaritosScreen extends HookWidget {
  final _scrollController = ScrollController();

  GabaritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      store.getNextPage(isFirstPage: true);

      return null;
    }, []);

    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 200) store.getNextPage();
    });

    return Scaffold(
      appBar: const LogoAppBar(title: 'Seus gabaritos', centerTitle: true),
      body: SafeArea(
        child: Observer(
          builder: (context) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            controller: _scrollController,
            children: [
              store.gabaritos.isEmpty && !store.isLoading
                  ? const Center(
                      child: Text('Nenhum gabarito encontrado'),
                    )
                  : Container(),
              ...store.gabaritos.map(
                (gab) => GabaritoCard(
                  gab,
                  onTap: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => GabaritoScreen(gabarito: gab),
                        ),
                      )
                      .then(
                        (_) => store.getNextPage(isFirstPage: true),
                      ),
                ),
              ),
              const SizedBox(height: 24),
              store.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
