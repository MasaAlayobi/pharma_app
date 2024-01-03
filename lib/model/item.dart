import 'package:flutter/material.dart';
import 'package:medicine_warehouse/model/codification.dart';
import 'package:medicine_warehouse/model/warehouse_model.dart';
import 'package:medicine_warehouse/model/warehouse_model.dart';

class Itme  extends StatelessWidget {
  Itme ({super.key, required this.Warehouse_model});
   final warehouse_model Warehouse_model;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(left: 20,right: 30,top: 31),
        child: Container(
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 34, 43, 101)
          ),
          // Color.fromARGB(255, 245, 232, 209)
          // 0xffF2D398
          // 0xffD78521
          child: Row(
            children: [
                Spacer(flex: 1),
              Icon(Icons.warehouse,color: Color.fromARGB(138, 245, 232, 209) ,size:40 ,),
               Spacer(flex: 2),
              Padding(
                padding:const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text('Warehouse Name : \n'+Warehouse_model.WareHouse_name,
                  style:TextStyle(color:Color.fromARGB(255, 245, 232, 209),fontSize:18 ,fontWeight: FontWeight.w600 ),),
                    //Padding(
                      //padding: EdgeInsets.only(bottom: 25),
                       //child: Text(Codification.Codificationstyle:TextStyle(color: Color(0xff230C02),fontSize:23,fontWeight: FontWeight.w600),),
                     //),
                  ],
                ),
              ),
              
 Spacer(flex: 2),
              // ClipRRect(
              //    borderRadius: BorderRadius.all(Radius.circular(20)),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 4.5),
              //     child: Image.asset(Codification.image,
              //     width: 120,
              //     height: 120,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      );
  }
}