import 'package:flutter/material.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';

class favoriteProvider extends ChangeNotifier{
   List<medicines_model> _FavoriteMedicines=[];
   List<medicines_model> get FavoriteMedicines =>_FavoriteMedicines;
  void toggleFavorite(medicines_model medicine){
    final isExist = _FavoriteMedicines.contains(medicine);
    if(isExist){
       _FavoriteMedicines.remove(medicine);
    }
    else{
      _FavoriteMedicines.add(medicine);
    }
    notifyListeners();
  }
  bool isExist (medicines_model medicine){
    final isExsit=_FavoriteMedicines.contains(medicine);
    return isExsit;
  }
  void clearFavorite(){
    _FavoriteMedicines=[];
    notifyListeners();
  }
}