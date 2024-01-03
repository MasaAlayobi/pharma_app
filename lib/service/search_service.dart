import 'package:dio/dio.dart';
import 'package:medicine_warehouse/config/getHeader.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/search_model.dart';

post_search(searchModel word)async{
Dio dio =Dio();
Response response=await dio.post('${baseURl}/search_WhatEver',
data: word.toJson(),
 options:  getHeader(useToken: true));
 if(response.statusCode==200){
  return response.data["data"];
 }else{
  print('error');
 }
}