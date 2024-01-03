import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';

class medication_details extends StatelessWidget {
  const medication_details({super.key, required this.medication});
   final medicines_model medication;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 245, 232, 209),
      // appBar: AppBar(),
        appBar: AppBar(
         elevation: 0,
         backgroundColor: Color(0xffE1BB80),
         title: Text(
           'Be Healthy'.tr(),
           style: TextStyle(
             color: Color.fromARGB(255, 37, 44, 88),
             fontWeight: FontWeight.bold,
             fontSize: 20,
           ),
         ),
         centerTitle: true,
         actions: [
           Icon(Icons.notifications, color: Color.fromARGB(255, 37, 44, 88))
         ],
       ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
               backgroundColor: Color(0xffE1BB80),
              radius: 80,
              child: Icon(
                Icons.vaccines,
                color: Color.fromARGB(255, 37, 44, 88),
                size: 120,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.medication_liquid_outlined,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                Text(
                  '  Commercial Name'.tr()+ ' : \n    '+medication.commercial_name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                 Icon(
                  Icons.healing,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                
                Text(
                  '  Scientific Name'.tr()+' : \n    '+medication.scientific_name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.category_outlined,
          //       color: Color(0xffE1BB80),
          //        size: 30,
          //     ), 
          //     Text(
          //       '  Category'.tr()+' : '+,
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 37, 44, 88),
          //           fontSize: 17,
          //           fontWeight: FontWeight.w400),
          //     ),
          //   ],
          // ),
          Expanded(
            child: Row(
              children: [
                 Icon(
                  Icons.apartment_outlined,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                Expanded(
                  child: Text(
                    '  Manufacture Company'.tr()+' : \n    '+medication.manufacture_company,
                    style: TextStyle(
                        color: Color.fromARGB(255, 37, 44, 88),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                 Icon(
                  Icons.production_quantity_limits_outlined,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                Text(
                  '  Quantity Available'.tr()+' : \n    '+medication.quantity_available.toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                 Icon(
                  Icons.date_range_outlined,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                Text(
                  '  Expiration Date'.tr()+' : \n    '+medication.expiration_date,
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                 Icon(
                  Icons.currency_lira_outlined,
                  color: Color(0xffE1BB80),
                   size: 30,
                ),
                Text(
                  '  Price'.tr()+' : \n    '+medication.price.toString()+' S.P',
                  style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
