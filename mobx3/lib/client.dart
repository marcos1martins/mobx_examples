import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  
  @observable
  String name = "";
  @action
  changeName(String newName) => name = newName;

  @observable
  String email = "";
  @action
  changeEmail(String newEmail) => email = newEmail;


  @observable
  String cpf = "";
  @action
  changeCpf(String newCpf) => cpf = newCpf;

}