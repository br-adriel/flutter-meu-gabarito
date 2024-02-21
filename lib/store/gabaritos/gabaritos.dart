import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:mobx/mobx.dart';

part 'gabaritos.g.dart';

class Gabaritos = GabaritosBase with _$Gabaritos;

abstract class GabaritosBase with Store {
  @readonly
  bool _isLoading = false;

  @readonly
  ObservableList<Gabarito> _gabaritos = ObservableList.of([]);
}
