import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_warehouse/bloc/medicines_bloc.dart';
import 'package:medicine_warehouse/model/codification.dart';
import 'package:medicine_warehouse/model/item.dart';
import 'package:medicine_warehouse/screen/Home/Home_Page.dart';
import 'package:medicine_warehouse/screen/Home/category_page.dart';
import 'package:medicine_warehouse/screen/log_in/sign_in.dart';
import 'package:medicine_warehouse/service/post_logout.dart';

// final List<codification> warehouses = const [
//   codification('healthy', ''),
//   codification('healthy', ''),
//   codification('healthy', ''),
//   codification('healthy', ''),
//   codification('healthy', '')
// ];

class warehouse extends StatefulWidget {
  warehouse({super.key});

  @override
  State<warehouse> createState() => _warehouseState();
}

class _warehouseState extends State<warehouse> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicinesBloc()..add(Getwarehouse()),
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
        drawer: Drawer(
          //  surfaceTintColor:Colors.white,
          shadowColor: Color.fromARGB(255, 37, 44, 88),
          width: 250,
          // 0xff22333B
          backgroundColor: Color.fromARGB(255, 37, 44, 88),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.person,
                size: 150,
                color: Color(0xffE1BB80),
              )),
              ListTile(
                onTap: () async {
                  print("-----");
                  bool isAccept = await logout();
                  if (isAccept) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return sign_in();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text('Failed'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                title: Text(
                  'Log Out'.tr(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE1BB80)),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Color(0xffE1BB80),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Language'.tr(),
                  //  value ? 'en' : 'ar' ,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE1BB80)),
                ),
                leading: Icon(
                  Icons.language,
                  color: Color(0xffE1BB80),
                ),
                trailing: Switch(
                    value: value,
                    onChanged: (val) {
                      if (val) {
                        context.setLocale(Locale('en'));
                        setState(() {
                          value = val;
                        });
                      } else {
                        setState(() {
                          value = val;
                        });
                        context.setLocale(Locale('ar'));
                      }
                    }),
              ),
            ],
          ),
        ),
        body: BlocConsumer<MedicinesBloc, MedicinesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SuccessFetchWarehouse) {
              return Column(
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
                          padding: const EdgeInsets.only(
                              left: 30, bottom: 15, right: 30),
                          child: Text(
                            'Available warehouse 🏪 :'.tr(),
                            style: TextStyle(
                              color: Color.fromARGB(255, 37, 44, 88),
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    //  height: 665,
                    child: ListView.builder(
                      itemCount: state.WareHousename.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              //  context..read<MedicinesBloc>().add(GetCtegory(IdWareHouse:  state.WareHousename[index].id));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Home_Page(
                                        idWarehouse:
                                            state.WareHousename[index].id);
                                  },
                                ),
                              );
                            },
                            child: Itme(
                              Warehouse_model: state.WareHousename[index],
                            ));
                      },
                      // scrollDirection: Axis.vertical,
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: 10,
                      //   crossAxisSpacing: 10,
                      //   mainAxisExtent: 260,
                      // ),
                    ),
                  ),
                ],
              );
            } else if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ConnectionErorr) {
              return Text('there is no connection');
            } else {
              return Text('not found');
            }
          },
        ),
      ),
    );
  }
}
