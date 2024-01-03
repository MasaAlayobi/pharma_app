import 'package:dio/dio.dart';
import 'package:medicine_warehouse/main.dart';

get_warehouse()async{
   try{
  Dio dio =Dio();
  Response response=await dio.get('${baseURl}/warehouses');
  if(response.statusCode==200){
      //  print(response.data);
     return response.data["data"];
     

  }else{
    return false;
  }
   }
   catch(e){
     throw e;
   }
}