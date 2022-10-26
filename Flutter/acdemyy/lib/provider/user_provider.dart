import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/models.dart';

class UserProvider extends ChangeNotifier {
  final String _apiKey = '123456';
  final String _baseUrl = 'acedmyc.somee.com';

  List<User> usersList = [];
  User? logUser;
  UserProvider();

  Map<String, String> get headers => {
        "Authorization": _apiKey,
      };

  getAllUsers() async {
    try {
      final decoded = await _getJsonData("/api/Usuario/getAll/");

      List<dynamic> result = decoded['result'];
      List<User> users = result.map<User>((e) => User.fromMap(e)).toList();
      usersList = List.from(usersList)..addAll(users); // Añadimos la lista de usuario retornada a la lista de usuariosProvider.
      notifyListeners(); //Notifica a los widgets sobre algun cambio.
    } catch (e) {
      // OneContext().showDialog(
      //     barrierDismissible: true,
      //     builder: (_) => AlertPopUp(
      //           context: _,
      //           err: e.toString(),
      //         ));
      // print(e);
    }
  }

  Future<dynamic> _getJsonData(String endPoint,
      [Map<String, dynamic>? params]) async {
    var url = Uri.http(_baseUrl, endPoint, params);
    final response = await http.get(url, headers: headers);
    Map<String, dynamic> decoded = json.decode(response.body);
    return decoded;
  }

  Future<dynamic> getUserById(int id) async {
    User? currentUser;
    try {
      final decoded =
          await _getJsonData("/api/Usuario/getById/", {'id': '$id'});
      dynamic result = decoded["result"];
      currentUser = User.fromMap(result);
      notifyListeners(); //Notifica a los widgets sobre algun cambio.
      return currentUser;
    } catch (e) {
      // OneContext().showDialog(
      //     barrierDismissible: true,
      //     builder: (_) => AlertPopUp(
      //           context: _,
      //           err: e.toString(),
      //         ));
      // print(e);
    }
    return currentUser;
  }

  dynamic login(int id, String pass) async {
    dynamic currentUser = await getUserById(id);
    User us;
    if (currentUser == null) {
      return "No se encontro el Usuario.";
    } else {
      us = currentUser;
      if (us.password != pass) {
        return false;
      } else {
        return logUser = us;
      }
    }
  }
}
