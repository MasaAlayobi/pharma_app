import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/model/favorite_model.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';
import 'package:medicine_warehouse/model/order_model.dart';
import 'package:medicine_warehouse/provider/favorite_provider.dart';
import 'package:medicine_warehouse/provider/order_provider.dart';
import 'package:medicine_warehouse/screen/Home/Favorite.dart';
import 'package:medicine_warehouse/screen/Home/Home_Page.dart';
import 'package:medicine_warehouse/screen/medicines/medication_details.dart';
import 'package:medicine_warehouse/service/favorite_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class medicines extends StatelessWidget {
  medicines({super.key, required this.allMedicies});
  final List<medicines_model> allMedicies;
  TextEditingController amount = TextEditingController();
  // List<String> medicinesList = [
  //   'Aspirin',
  //   'paracetamol',
  //   'profen',
  //   'Acetaminophen',
  // ];
  @override
  Widget build(BuildContext context) {
    final favoriteprovider = Provider.of<favoriteProvider>(context);
    final provider = Provider.of<orderProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 232, 209),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Color(0xffE1BB80)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // CircleAvatar(
                //      radius: 18,
                //   backgroundColor: Color(0xffE1BB80),
                //   // backgroundImage:

                //     foregroundImage: AssetImage('assets/4.jpg',

                //       ) ,
                //       // foregroundColor:Color.fromARGB(255, 84, 83, 80) ,
                //     // Image.asset(
                //   //    'assets/4.jpg',
                //       //  colorBlendMode: BlendMode.hardLight,
                //   //     color: Color.fromARGB(187, 225, 186, 128),
                //   //  ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 15),
                  child: Text(
                    'Medicines in this category 💊 :'.tr(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 37, 44, 88),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              // ! return state value
              itemCount: allMedicies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.read<MedicinesBloc>().add(GetMedicines(medicinesDetails: state.category[state.category[index].toString()][index]));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return medication_details(
                              medication: allMedicies[index]);
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    color: Color.fromARGB(226, 28, 39, 110),
                    child: SizedBox(
                      // width: 200,
                      // height: 450,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Icon(
                                Icons.vaccines,
                                color: Color.fromARGB(138, 245, 232, 209),
                                size: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Text(
                                ' Commercial Name : \n   ' +
                                    allMedicies[index].commercial_name,
                                style: TextStyle(
                                    color: Color.fromARGB(138, 245, 232, 209),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 0, right: 0),
                              child: Text(
                                ' Scientific Name : \n   ' +
                                    allMedicies[index].scientific_name,
                                style: TextStyle(
                                    color: Color.fromARGB(138, 245, 232, 209),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 0, right: 0),
                              child: Text(
                                ' Price : ' +
                                    allMedicies[index].price.toString() +
                                    ' S.P',
                                style: TextStyle(
                                    color: Color.fromARGB(138, 245, 232, 209),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Color.fromARGB(
                                                255, 245, 232, 209),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    provider.toggleOrder(
                                                        order_provider_model(
                                                            medicine_order:
                                                                allMedicies[
                                                                    index],
                                                            amount: int.parse(
                                                                amount.text)));
                                                    Navigator.pop(context);
                                                    amount.clear();
                                                  },
                                                  child: Text('Add')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel'))
                                            ],
                                            title: Text(
                                                'Enter the quantity you want! '),
                                            content: TextField(
                                              controller: amount,
                                              decoration: InputDecoration(
                                                hintText: 'Quantity available : ${allMedicies[index].quantity_available}'
                                              ),
                                            ),
                                          );
                                        });
                                    // provider.toggleFavorite(allMedicies[index]);
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Color.fromARGB(138, 245, 232, 209),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async{
                                     bool isAccept= await postFavorite(favoriteModel(medicine_id: allMedicies[index].id),int.tryParse(config.get<SharedPreferences>().getString('IdUser')!) ! );
                                     print(favoriteModel(medicine_id: allMedicies[index].id));
                                      print(int.tryParse(config.get<SharedPreferences>().getString('IdUser')!) !);
                                      if(isAccept){
                                      favoriteprovider
                                          .toggleFavorite(allMedicies[index]);
                                    }
                                    else{
                                      print('-------------------------------');
                                    }

                                      },
                                    icon: favoriteprovider
                                            .isExist(allMedicies[index])
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: Color.fromARGB(
                                                138, 245, 232, 209),
                                          )),
                              ],
                            )
                          ]),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 260,
              ),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.all(Radius.circular(20)),
          //   child: ListTile(
          //     tileColor: Colors.red,
          //     title: Text(
          //                     'Scientific Name :  '.tr(),
          //                     style: TextStyle(
          //                         // color: Color.fromARGB(255, 245, 232, 209),
          //                         fontSize: 14),
          //                   ),
          //   ),
          // )
        ],
      ),
    );
  }
}
//  ListView.builder(
//                 itemCount:allMedicies.length,
//                 itemBuilder: (context, num) {
//                   return InkWell(

//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return medication_details(medication: allMedicies[num]) ;
//                           },
//                         ),
//                       );
//                     },
//                     child:  Padding(
//         padding: EdgeInsets.only(left: 20,right: 30,top: 31),
//         child: Expanded(
//           child: Container(
//             width: 400,
//             height: 200,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               color: Color.fromARGB(255, 34, 43, 101)
//             ),
//             // Color.fromARGB(255, 245, 232, 209)
//             // 0xffF2D398
//             // 0xffD78521
//             child: Row(
//               children: [
//                   Spacer(flex: 1),
//                 Icon(Icons.vaccines,color: Color.fromARGB(138, 245, 232, 209) ,size:40 ,),
//                  Spacer(flex: 2),
//                 Padding(
//                   padding:const EdgeInsets.only(left: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [

//                      Text('  Commercial Name \n'+ allMedicies[num].commercial_name,
//                     style:TextStyle(color:Color.fromARGB(255, 245, 232, 209),fontSize:14 ,fontWeight: FontWeight.w600 ),),
//                     Text('  Scientific Name \n'+ allMedicies[num].scientific_name,
//                     style:TextStyle(color:Color.fromARGB(255, 245, 232, 209),fontSize:14 ,fontWeight: FontWeight.w600 ),),
//                     Text('  Price \n'+ allMedicies[num].price.toString(),
//                     style:TextStyle(color:Color.fromARGB(255, 245, 232, 209),fontSize:14 ,fontWeight: FontWeight.w600 ),),
//                       //Padding(
//                         //padding: EdgeInsets.only(bottom: 25),
//                          //child: Text(Codification.Codificationstyle:TextStyle(color: Color(0xff230C02),fontSize:23,fontWeight: FontWeight.w600),),
//                        //),
//                     ],
//                   ),
//                 ),

//            Spacer(flex: 2),
//                 // ClipRRect(
//                 //    borderRadius: BorderRadius.all(Radius.circular(20)),
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.only(left: 4.5),
//                 //     child: Image.asset(Codification.image,
//                 //     width: 120,
//                 //     height: 120,
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         ),
//       )
//                   );
//                 }),
