import 'dart:async';

import 'package:http/http.dart' as http;

import '../../helpers/CacheHelper.dart';
import '../Models/annoucements/annoucements.dart';

class AnnoucementsRepo {
  Future<Annoucements?> getAnnoucements() async {
    var response = await http.get(
      Uri.parse(
          'http://secure-castle-07090.herokuapp.com/api/v1/announcements'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        "Authorization": "Bearer ${CacheHelper.prefs!.getString("token")}"
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final data = Annoucements.fromJson(response.body);
      // MyApplication.showToast(text: "success", color: ToastColors.success);
      return data;
    } else {
      final data = Annoucements.fromJson(response.body);
      // MyApplication.showToast(text: "error", color: ToastColors.error);
      return data;
    }
  }
}
