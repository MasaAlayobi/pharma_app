import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/getHeader.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(loginModel user)async{
  // print(user);
  Dio dio=Dio();
  //  try {
    Response response=await dio.post('${baseURl}/login',
  data:user.toJson(),
  options:  getHeader(useToken: true)
  );
  print('----------------');
  print(response);
  if(response.statusCode==200){
    config.get<SharedPreferences>().setString('token', response.data['token']);
    print(response.data);
    return true;
  }else{
  print('error');
  return false;}
  //  } catch (e) {
  //    return false;
  //  }
  
}