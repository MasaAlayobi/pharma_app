import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicine_warehouse/provider/favorite_provider.dart';
import 'package:medicine_warehouse/provider/order_provider.dart';
import 'package:medicine_warehouse/screen/medicines/medication_details.dart';
import 'package:provider/provider.dart';

class favoritePage extends StatelessWidget {
  const favoritePage ({super.key});

  @override
  Widget build(BuildContext context) {
     final providerfavorite= Provider.of<favoriteProvider>(context);
  final FavoriteMedicines=providerfavorite.FavoriteMedicines;
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
              itemCount: FavoriteMedicines.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.read<MedicinesBloc>().add(GetMedicines(medicinesDetails: state.category[state.category[index].toString()][index]));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return medication_details(
                              medication: FavoriteMedicines[index]);
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
                                    FavoriteMedicines[index].commercial_name,
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
                                    FavoriteMedicines[index].scientific_name,
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
                                    FavoriteMedicines[index].price.toString() +
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
                                // IconButton(
                                //   onPressed: () {
                                //     showDialog(
                                //         context: context,
                                //         builder: (context) {
                                //           return AlertDialog(
                                //             backgroundColor: Color.fromARGB(
                                //                 255, 245, 232, 209),
                                //             actions: [
                                //               TextButton(
                                //                   onPressed: () {
                                //                     provider.toggleOrder(
                                //                         order_provider_model(
                                //                             medicine_order:
                                //                                 allMedicies[
                                //                                     index],
                                //                             amount: int.parse(
                                //                                 amount.text)));
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: Text('Add')),
                                //               TextButton(
                                //                   onPressed: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: Text('Cancel'))
                                //             ],
                                //             title: Text(
                                //                 'Enter the quantity you want! '),
                                //             content: TextField(
                                //               controller: amount,
                                //             ),
                                //           );
                                //         });
                                //     // provider.toggleFavorite(allMedicies[index]);
                                //   },
                                //   icon: Icon(
                                //     Icons.shopping_cart,
                                //     color: Color.fromARGB(138, 245, 232, 209),
                                //   ),
                                // ),
                                IconButton(
                                    onPressed: () {
                                      providerfavorite.toggleFavorite(FavoriteMedicines[index]);
                                    },
                                    icon: providerfavorite
                                            .isExist(FavoriteMedicines[index])
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