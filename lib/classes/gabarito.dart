import 'package:cloud_firestore/cloud_firestore.dart';

class Gabarito {
  String? id;
  String? nome;
  int? contagemCorrigidas;
  int? contagemCorretas;
  int? tamanho;
  DateTime? createdAt;
  DateTime? updatedAt;

  Gabarito({
    required this.nome,
    required this.tamanho,
    required this.contagemCorretas,
    required this.contagemCorrigidas,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  double get porcentagemCorrigidas {
    if (contagemCorrigidas == null || tamanho == null || tamanho == 0) return 0;
    return (contagemCorrigidas! ~/ tamanho!).toDouble();
  }

  double get porcentagemCorretas {
    if (contagemCorretas == null ||
        contagemCorrigidas == null ||
        contagemCorrigidas == 0) return 0;
    return (contagemCorretas! ~/ contagemCorrigidas!).toDouble();
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
      id: snapshot.id,
      nome: data?['nome'],
      contagemCorretas: data?['contagemCorretas'],
      contagemCorrigidas: data?['contagemCorrigidas'],
      tamanho: data?['tamanho'],
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      updatedAt: (data?['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nome != null) 'nome': nome,
      if (contagemCorretas != null) 'contagemCorretas': contagemCorretas,
      if (contagemCorrigidas != null) 'contagemCorrigidas': contagemCorrigidas,
      if (tamanho != null) 'tamanho': tamanho,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
