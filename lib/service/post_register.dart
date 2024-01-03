import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/getHeader.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

register (registerModel user) async{
      try{
  Dio dio =Dio();
  Response response = await dio.post('${baseURl}/register',
  data: user.toJson(),
  options: getHeader(useToken: true)
  );
  if(response.statusCode==200){
     config.get<SharedPreferences>().setString('token', response.data['token']);
     config.get<SharedPreferences>().setString('IdUser', response.data['id'].toString());

    print(config.get<SharedPreferences>().getString('IdUser'));
  }
  else{
    print('error');
  }
  return true;
      }
      catch(e){
       throw e;
      }
}