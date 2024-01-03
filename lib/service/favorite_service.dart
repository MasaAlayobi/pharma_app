import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/getHeader.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/favorite_model.dart';

postFavorite(favoriteModel medicineId,int idUser)async{
Dio dio=Dio();
Response response=await dio.post('${baseURl}/favourite/store/$idUser',
data:medicineId.toJson(),
options: getHeader());
if(response.statusCode==200){
  print(response.data);
  return true;
}
else{
  print('error');
  return false;
}
}