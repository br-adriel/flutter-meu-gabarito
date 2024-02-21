import 'package:meu_gabarito/classes/questao.dart';

class Gabarito {
  String id;
  String nome;
  List<Questao> questoes;

  Gabarito({required this.id, required this.nome, required this.questoes});

  bool get corrigido => questoes.every((q) => q.corrigida);

  int get contagemCorrigidas => questoes.where((q) => q.corrigida).length;

  int get porcentagemCorrigidas =>
      (contagemCorrigidas ~/ questoes.length) * 100;

  int get contagemAcertadas => questoes
      .where((q) => q.alternativaCorreta == q.alternativaSelecionada)
      .length;

  int get porcentagemAcertadas => contagemAcertadas ~/ contagemCorrigidas;
}
