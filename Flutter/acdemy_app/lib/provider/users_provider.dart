import 'package:acdemy_app/components/components.dart';
import 'package:acdemy_app/models/user_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_context/one_context.dart';
import 'dart:convert';

class UsersProvider extends ChangeNotifier {
  final String _apiKey = '123456';
  final String _baseUrl = '192.168.0.13:7173';

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": _apiKey,
      };

  List<UserResponse> UsersList = [];

  UsersProvider() {
    getAllUsers();
  }

  getAllUsers() async {
    var url = Uri.https(_baseUrl, '/api/Usuario/getAll');
    try {
      final response = await http.get(url, headers: headers);
      List<UserResponse> users = json
          .decode(response.body)
          .map<UserResponse>((e) => UserResponse.fromMap(e))
          .toList();
      UsersList = users;
      notifyListeners(); //Notifica a los widgets sobre algun cambio.
    } catch (e) {
      OneContext().showDialog(
          barrierDismissible: true,
          builder: (_) => AlertPopUp(
                context: _,
                err: e.toString(),
              ));
    }
  }
}
