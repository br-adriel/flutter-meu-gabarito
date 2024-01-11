import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:mobx/mobx.dart';

part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final auth = Auth();
}
