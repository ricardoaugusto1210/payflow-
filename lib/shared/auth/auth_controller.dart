import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  // Variável privada
  UserModel? _user;

  // Símbolo de exclamação "!" para garantir que não está nulo.
  UserModel get user => _user!;

  // Verificando se usuário não é nulo
  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      // Navegação - rotas nomeadas
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  // Função que salva usuário
  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  // Verifica os dados do usuários salvo e redireciona para home page
  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    // Duração da splash
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
