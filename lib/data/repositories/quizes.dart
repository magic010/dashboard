import 'dart:async';

import 'package:http/http.dart' as http;

import '../../helpers/CacheHelper.dart';
import '../Models/quizes/quizes.dart';

class quizesRepo {
  Future<Quizes?> getQuizes() async {
    var response = await http.get(
      Uri.parse('http://secure-castle-07090.herokuapp.com/api/v1/quizzes'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        "Authorization": "Bearer ${CacheHelper.prefs!.getString("token")}"
      },
    );
    // print({CacheHelper.prefs!.getString("token")});

    if (response.statusCode == 200) {
      final data = Quizes.fromJson(response.body);
      // MyApplication.showToast(text: "success", color: ToastColors.success);
      return data;
    } else {
      final data = Quizes.fromJson(response.body);
      // MyApplication.showToast(text: "error", color: ToastColors.error);
      return data;
    }
  }
}
