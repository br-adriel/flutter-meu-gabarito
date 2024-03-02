import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/widgets/gabarito_actions.dart';
import 'package:meu_gabarito/widgets/gabarito_stats.dart';
import 'package:meu_gabarito/widgets/logo_appbar.dart';
import 'package:meu_gabarito/widgets/questao_card.dart';
import 'package:provider/provider.dart';

class GabaritoScreen extends HookWidget {
  final String id;

  const GabaritoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      final listeners = store.getGabarito(id);
      return () {
        for (var listener in listeners) {
          listener.cancel();
        }
      };
    }, []);

    return Observer(builder: (context) {
      return store.gabarito == null || store.isLoading
          ? const Scaffold(
              appBar: LogoAppBar(
                title: 'Carregando...',
                centerTitle: true,
              ),
              body: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: LogoAppBar(
                title: store.gabarito?.nome ?? '',
                centerTitle: true,
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                children: [
                  GabaritoStats(
                    tamanho: store.gabarito?.tamanho ?? 0,
                    acertos: store.gabarito?.contagemCorretas ?? 0,
                    corrigidas: store.gabarito?.contagemCorrigidas ?? 0,
                    taxaAcerto: store.gabarito?.porcentagemCorretas ?? 0.0,
                    taxaCorrecao: store.gabarito?.porcentagemCorrigidas ?? 0.0,
                  ),
                  const SizedBox(height: 12),
                  GabaritoActions(),
                  const SizedBox(height: 12),
                  ...store.questoes.map((q) => QuestaoCard(q)),
                ],
              ),
            );
    });
  }
}
