import 'package:cloud_firestore/cloud_firestore.dart';

class Gabarito {
  String? id;
  String? nome;
  int? contagemCorrigidas;
  int? contagemCorretas;
  int? tamanho;

  Gabarito({
    required this.id,
    required this.nome,
    required this.tamanho,
    required this.contagemCorretas,
    required this.contagemCorrigidas,
  });

  int get porcentagemCorrigidas {
    if (contagemCorrigidas == null || tamanho == null) return 0;
    return (contagemCorrigidas! ~/ tamanho!) * 100;
  }

  int get porcentagemCorretas {
    if (contagemCorretas == null || contagemCorrigidas == null) return 0;
    return contagemCorretas! ~/ contagemCorrigidas! * 100;
  }

  bool get corrigido {
    if (contagemCorrigidas == null || tamanho == null) return false;
    return contagemCorrigidas == tamanho;
  }

  factory Gabarito.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Gabarito(
      id: data?['id'],
      nome: data?['nome'],
      contagemCorretas: data?['contagemCorretas'],
      contagemCorrigidas: data?['contagemCorrigidas'],
      tamanho: data?['tamanho'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (contagemCorretas == null) 'contagemCorretas': contagemCorretas,
      if (contagemCorrigidas == null) 'contagemCorrigidas': contagemCorrigidas,
      if (tamanho == null) 'tamanho': tamanho,
    };
  }
}
