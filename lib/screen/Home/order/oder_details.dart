import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_warehouse/bloc/orders_bloc.dart';

class OrderDetails extends StatelessWidget {
   OrderDetails({super.key, required this.idOder});
final int idOder;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc()..add(FetchOrderDetails(idOrder:idOder )),
      child: Scaffold(
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
                      'Order Details : ',
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
            BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                if (state is SuccessFetchOderDetails) {
                  return Expanded(
                    child: GridView.builder(
                      // ! return state value
                      itemCount: state.oderDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // context.read<MedicinesBloc>().add(GetMedicines(medicinesDetails: state.category[state.category[index].toString()][index]));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return medication_details(
                            //           medication: allMedicies[index]);
                            //     },
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 6,
                            color: Color.fromARGB(226, 28, 39, 110),
                            child: SizedBox(
                              // width: 200,
                              // height: 450,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Icon(
                                        Icons.vaccines,
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                        size: 50,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Text(
                                        ' medicine Name  : \n   ' +
                                            state.oderDetails[index].medicine,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                138, 245, 232, 209),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 0, right: 0),
                                      child: Text(
                                        ' Amount : ' +
                                            state.oderDetails[index].amount
                                                .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                138, 245, 232, 209),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 260,
                      ),
                    ),
                  );
                } else if (state is Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ConnectionErorr) {
                  return Center(child: Text('connection error'));
                } 
                else if(state is NotFound){
                 return Center(child: Text('not found')); 
                }
                else {
                  return Center(child: Text('error'));
                }
              },
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
      ),
    );
  }
}
