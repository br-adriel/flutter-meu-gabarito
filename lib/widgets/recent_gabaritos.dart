import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/widgets/gabarito_card.dart';
import 'package:provider/provider.dart';

class RecentGabaritos extends HookWidget {
  final int limit;
  final EdgeInsetsGeometry padding;

  const RecentGabaritos(
      {super.key, this.limit = 3, this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      store.getGabaritos(limit: limit);
      return () {};
    }, []);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Gabaritos recentes', style: title2TextStyle),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver todos',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          Observer(builder: (context) {
            if (store.isLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return Column(
                children: store.gabaritos
                    .map<Widget>((gab) => GabaritoCard(gab))
                    .toList(),
              );
            }
          })
        ],
      ),
    );
  }
}
