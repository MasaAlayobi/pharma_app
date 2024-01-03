import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

getHeader({bool useToken = false}) {
  if (useToken) {
    return Options(headers: {
      "authorization":
          "Bearer ${config.get<SharedPreferences>().getString('token')}",
      "Accept": "application/json"
    });
  }else {
      return Options(headers: {
      "Accept": "application/json"
    });
  }
}
