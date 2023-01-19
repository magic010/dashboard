import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/login/login.dart';

class LoginRepo {
  Future<Login?> userLogin(
      {required String email, required String password}) async {
    var response = await http.post(
      Uri.parse('http://secure-castle-07090.herokuapp.com/api/v1/auth/login'),
      body: jsonEncode({"email": "mostafa@gmail.com", "password": "123456"}),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final data = Login.fromJson(response.body);
      // MyApplication.showToast(text: "success", color: ToastColors.success);
      return data;
    } else {
      final data = Login.fromJson(response.body);
      // MyApplication.showToast(text: "error", color: ToastColors.error);
      return data;
    }
  }
}
