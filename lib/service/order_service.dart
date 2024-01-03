import 'package:dio/dio.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/orders_model.dart';

Order_Post (ordersModel orders,int id)async{
  Dio dio =Dio();
  try{
  Response response= await dio.post('${baseURl}/order/store/$id',
  data: orders.toJson(),
  options: Options(
    headers: {'Accept':'application/json'}
  ));
  if(response.statusCode==200){
 print(response.data);
  }
  else{
   return false;
  }
  return true;
  }catch(e){
return false;
  }
}
getAllOrder(int userId)async{
 Dio dio =Dio();
 try{
Response response= await dio.get('http://127.0.0.1:8000/api/order/$userId');
if(response.statusCode==200){
   print(response.data);
  return response.data["data"];
}


else{
    print('-----------------------'); 
}

 }on DioException
 catch(e){
  print(e);
 }
}
getOrderDetails(int idOrder)async{
  Dio dio =Dio();
   try{

  Response response= await dio.get('http://127.0.0.1:8000/api/order/Details/$idOrder');
  print(response.data["data"]);
  if(response.statusCode==200){
    return response.data["data"];
  }
  else{
    print('error');
  }
   }
 on DioException
  catch(e){
   print(e);
  }

}