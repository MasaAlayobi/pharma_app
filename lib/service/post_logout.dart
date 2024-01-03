import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/getHeader.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout()async{
  Dio dio=Dio();
  try{
  Response response=await dio.get('${baseURl}/logout',
  
  options: getHeader(useToken: true)
  );
  if(response.statusCode == 200){
 // TODO : remove token from get_it
 config.get<SharedPreferences>().setString('token', 'null');
  print(config.get<SharedPreferences>().getString('token'));
 return true;
  }
  else {
    return false;
  }}
  catch(e){
    return false;
  }

 
}