import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/widgets/gabarito_actions.dart';
import 'package:meu_gabarito/widgets/gabarito_stats.dart';
import 'package:meu_gabarito/widgets/logo_appbar.dart';
import 'package:meu_gabarito/widgets/questao_card.dart';
import 'package:provider/provider.dart';

class GabaritoScreen extends HookWidget {
  final Gabarito gabarito;

  const GabaritoScreen({super.key, required this.gabarito});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      final listeners = store.getGabarito(gabarito.id!);
      return () {
        for (var listener in listeners) {
          listener.cancel();
        }
      };
    }, []);

    return Scaffold(
      appBar: LogoAppBar(centerTitle: true, title: gabarito.nome!),
      body: store.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Observer(
              builder: (context) => ListView(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                children: [
                  GabaritoStats(
                    tamanho: gabarito.tamanho!,
                    acertos: gabarito.contagemCorretas!,
                    corrigidas: gabarito.contagemCorrigidas!,
                    taxaAcerto: gabarito.porcentagemCorretas,
                    taxaCorrecao: gabarito.porcentagemCorrigidas,
                  ),
                  const SizedBox(height: 12),
                  GabaritoActions(gabarito),
                  const SizedBox(height: 12),
                  ...store.questoes.map((q) => QuestaoCard(q)),
                ],
              ),
            ),
    );
  }
}
