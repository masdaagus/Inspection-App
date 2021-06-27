import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> sigUp(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDA_YNoRqAGlv6gVp6A48PZPdvvROt43N8");

    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      print(json.decode(response.body));

      final responData = json.decode(response.body);
      if (responData['error'] != null) {
        throw responData['error']['message'];
      }
    } catch (error) {
      print(error);
      throw "Email already exist";
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDA_YNoRqAGlv6gVp6A48PZPdvvROt43N8");

    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      print(json.decode(response.body));

      final responData = json.decode(response.body);
      if (responData['error'] != null) {
        throw responData['error']['message'];
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> reset(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyDA_YNoRqAGlv6gVp6A48PZPdvvROt43N8");

    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      print(json.decode(response.body));

      final responData = json.decode(response.body);
      if (responData['error'] != null) {
        throw responData['error']['message'];
      }
    } catch (error) {
      throw error;
    }
  }
}
