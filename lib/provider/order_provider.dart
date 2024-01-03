import 'package:flutter/foundation.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';
import 'package:medicine_warehouse/model/order_model.dart';

class orderProvider extends ChangeNotifier{
   List<order_provider_model> _orders=[];
   List<order_provider_model> get orders =>_orders;
  void toggleOrder(order_provider_model medicine){
    final isExist = _orders.contains(medicine);
    if(isExist){
       _orders.remove(medicine);
    }
    else{
      _orders.add(medicine);
    }
    notifyListeners();
  }
  bool isExist (order_provider_model medicine){
    final isExsit=_orders.contains(medicine);
    return isExsit;
  }
  void clearFavorite(){
    _orders=[];
    notifyListeners();
  }
}