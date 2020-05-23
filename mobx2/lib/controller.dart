import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  @observable
  String nome = "";

  @observable
  String sobrenome = "";

  @computed
  String get nomeCompleto => "$nome $sobrenome";

  @action
  mudarNome(novoNome){
    nome = novoNome;
  }

  @action
  mudarSobrenome(novoSobrenome){
    sobrenome = novoSobrenome;
  }

}