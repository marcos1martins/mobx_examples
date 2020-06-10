import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  @observable
  int counter = 0;

  @computed
  bool get isEven => counter % 2 == 0;

  @action 
  void incrementCounter() {
      counter++;
  }
}