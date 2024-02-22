import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_gabarito/enums/alternativa.dart';

class Questao {
  String? id;
  int? numero;
  Alternativa? alternativaSelecionada;
  Alternativa? alternativaCorreta;
  bool? corrigida;

  Questao({
    required this.alternativaSelecionada,
    required this.corrigida,
    required this.numero,
    required this.alternativaCorreta,
    this.id,
  });

  factory Questao.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Questao(
      id: snapshot.id,
      alternativaSelecionada: data?['alternativaSelecionada'],
      corrigida: data?['corrigida'],
      numero: data?['numero'],
      alternativaCorreta: data?['alternativaCorreta'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (alternativaCorreta != null) 'alternativaCorreta': alternativaCorreta,
      if (alternativaSelecionada != null)
        'alternativaSelecionada': alternativaSelecionada,
      if (corrigida != null) 'corrigida': corrigida,
      if (numero != null) 'numero': numero,
    };
  }
}
