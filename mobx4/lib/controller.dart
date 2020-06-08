import 'package:mobx/mobx.dart';

import 'client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  Client client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }
  String validateName(){
    if(client.name == null || client.name.isEmpty){
      return 'este campo é obrigatório';
    } else if(client.name.length < 3){
      return 'nome deve ter pelo menos três caracteres';
    }
    return null;
  }

  String validateEmail(){
    if(client.email == null || client.email.isEmpty){
      return 'este campo é obrigatório';
    } else if(!client.email.contains("@")){
      return 'esse não é um email valido';
    }
    return null;
  }

  dispose(){
    print('dispose');
  }
  
}