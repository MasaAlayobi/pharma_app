import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_warehouse/bloc/orders_bloc.dart';
import 'package:medicine_warehouse/model/get_order_Model.dart';
import 'package:medicine_warehouse/provider/order_provider.dart';
import 'package:medicine_warehouse/screen/Home/order/Send_Order.dart';
import 'package:medicine_warehouse/screen/Home/order/oder_details.dart';
import 'package:provider/provider.dart';

class orderPage extends StatelessWidget {
  orderPage({super.key, required this.idWarehouse, required this.idUser});

  final int idWarehouse;
  final int idUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc()..add(FetchOrders(idUser: idUser)),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 232, 209),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xffE1BB80),
          // leading: Icon(Icons.search,color: Color(0xff230C02),),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Be Healthy'.tr(),
              style: TextStyle(
                  color: Color.fromARGB(255, 37, 44, 88),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        body: Column(
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 15, right: 0),
                    child: Text(
                      'Your orders : '.tr(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 37, 44, 88),
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            //
                            return sendOrder(
                                idWarehouse: idWarehouse, idUser: idUser);
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 245, 232, 209)),
                          width: 140,
                          height: 30,
                          child: Center(
                            child: Text('send your orders',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 37, 44, 88),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            BlocConsumer<OrdersBloc, OrdersState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is SuccessFetchorder) {
                  print(state.order);
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh:() async{
                         context.read<OrdersBloc>().add(FetchOrders(idUser: idUser));
                      },
                      child: ListView.builder(
                        // physics: BouncingScrollPhysics(),
                          itemCount: state.order.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  onTap: () {
                                    print('------------------------------');
                                    print(state
                                        .order[state.order.length - (index + 1)]
                                        .id);
                                    // context.read<OrdersBloc>().add(FetchOrderDetails(idOrder: state.order[state.order.length-(index+1)].id));
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return OrderDetails(
                                          idOder: state
                                              .order[state.order.length -
                                                  (index + 1)]
                                              .id);
                                    }));
                                  },
                                  child: ExpansionTile(
                                    expandedAlignment: Alignment.centerLeft,
                                    title: Text(
                                      'The number of order : ' +
                                          state
                                              .order[state.order.length -
                                                  (index + 1)]
                                              .id
                                              .toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 245, 232, 209),
                                          fontSize: 18),
                                    ),
                                    leading: Icon(Icons.shopping_cart,
                                        color:
                                            Color.fromARGB(255, 245, 232, 209)),
                                    subtitle: Text(
                                      ' WareHouse Name :  ' +
                                          state
                                              .order[state.order.length -
                                                  (index + 1)]
                                              .warehouse_name,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 245, 232, 209),
                                          fontSize: 18),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(226, 28, 39, 110),
                                    collapsedBackgroundColor:
                                        Color.fromARGB(226, 28, 39, 110),
                    
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ' Total price :  ' +
                                            state
                                                .order[state.order.length -
                                                    (index + 1)]
                                                .price
                                                .toString() +
                                            ' S.P'.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ' Payment Status :  ' +
                                            state
                                                .order[state.order.length -
                                                    (index + 1)]
                                                .payment_status,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ' Order Status :  ' +
                                            state
                                                .order[state.order.length -
                                                    (index + 1)]
                                                .order_status,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                    //  style:ListTileStyle.list ,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else if (state is Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ConnectionErorr) {
                  return Text('connection error');
                } else {
                  return Text('not found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
