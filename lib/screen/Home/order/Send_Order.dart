import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_warehouse/bloc/orders_bloc.dart';
import 'package:medicine_warehouse/model/order_model.dart';
import 'package:medicine_warehouse/model/orders_model.dart';
import 'package:medicine_warehouse/provider/order_provider.dart';
import 'package:medicine_warehouse/service/order_service.dart';
import 'package:provider/provider.dart';

class sendOrder extends StatelessWidget {
  sendOrder(
      {super.key,
      required this.idWarehouse,
       required this.idUser,
      // required this.idOrder
      });
  final int idWarehouse;
  final int idUser;
  // final int idOrder;
  @override
  Widget build(BuildContext context) {
    final provider1 = Provider.of<orderProvider>(context);
    final orders = provider1.orders;
    return BlocProvider(
      create: (context) => OrdersBloc(),
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 232, 209),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xffE1BB80),
            // leading: Icon(Icons.search,color: Color(0xff230C02),),
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Be Healthy'.tr(),
                style: TextStyle(
                    color: Color(0xff22333B),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  // ! return state value
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //                   // context.read<MedicinesBloc>().add(GetMedicines(medicinesDetails: state.category[state.category[index].toString()][index]));
                        //                   // Navigator.push(
                        //                   //   context,
                        //                   //   MaterialPageRoute(
                        //                   //     builder: (context) {
                        //                   //       return medication_details(
                        //                   //           medication: allMedicies[index]);
                        //                   //     },
                        //                   //   ),
                        //                   // );
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
                                        orders[index]
                                            .medicine_order
                                            .commercial_name,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, right: 0),
                                  child: Text(
                                    ' Scientific Name : \n   ' +
                                        orders[index]
                                            .medicine_order
                                            .scientific_name,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, right: 0),
                                  child: Text(
                                    ' Price : ' +
                                        orders[index]
                                            .medicine_order
                                            .price
                                            .toString() +
                                        ' S.P',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, right: 0),
                                  child: Text(
                                    ' Amount : ' +
                                        orders[index].amount.toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        provider1.toggleOrder(orders[index]);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color:
                                            Color.fromARGB(138, 245, 232, 209),
                                      ),
                                    ),
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
              InkWell(
                onTap: () async {
                  List<int> idMedicines = List.generate(orders.length,
                      (index) => orders[index].medicine_order.id);
                  List<int> amount = List.generate(
                      orders.length, (index) => orders[index].amount);

                  bool isDone = await Order_Post(
                      ordersModel(
                          warehouse_id: idWarehouse,
                          medicines: idMedicines,
                          amount: amount),
                      idUser);
                  if (isDone) {
                    provider1.clearFavorite();

                    //  context.read<OrdersBloc>().add(FetchOrders(idUser: idUser));
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text('success'),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text('Failed'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffE1BB80),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Text(
                      'send',
                      style: TextStyle(
                          color: Color.fromARGB(226, 28, 39, 110),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
