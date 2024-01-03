import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_warehouse/bloc/medicines_bloc.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/model/codification.dart';
import 'package:medicine_warehouse/model/item.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';
import 'package:medicine_warehouse/screen/medicines/medicines_page.dart';
import 'package:medicine_warehouse/screen/log_in/sign_in.dart';
import 'package:medicine_warehouse/service/post_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool value = true;

class category_page extends StatefulWidget {
  category_page({super.key, required this.id2});
    final int id2;
  @override
  State<category_page> createState() => _category_pageState();
}

class _category_pageState extends State<category_page> {
    final List<codification> codifications = const [
      codification('Pain Killers', 'assets/PK.jpg'),
      codification('Inflammation \n Medications', 'assets/I.jpg'),
      codification('Immunomodulatory \n Medications', 'assets/IM.png'),
      codification('Dermatological \n Medications', 'assets/DM.png'),
      codification('Hormonedisorders \n Medications', 'assets/HM.png')
    ];
//     final List<String>  = [
//   'Pain Killers',
//   'Inflammation',
//   'Immunomodulatory Medications',
//   'Dermatological Medications',
//   'Hormonedisorders  Medications',
// ];

  // This widget is the root of your application.
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>MedicinesBloc()..add(GetCtegory(IdWareHouse: widget.id2)),
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
              if (state is SuccessFetchMedicines) {
                print('-------------');
                return Column(
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
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 5),
                              child: Text(
                                'Choose the category \n you want ! '.tr(),
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
                        //  height: 665,
                        child: GridView.builder(
                          // ! return state value
                          itemCount: state.category.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                List<medicines_model> allMedicines=List.generate(state.category[index].length, (ind) =>medicines_model.fromMap(state.category[index][ind]));
                                // context.read<MedicinesBloc>().add(GetMedicines(medicinesDetails: state.category[state.category[index].toString()][index]));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return medicines(allMedicies:allMedicines);
                                      
                                    },
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 6,
                                color: Color.fromARGB(255, 34, 43, 101),
                                child: SizedBox(
                                  // width: 200,
                                  // height: 450,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          codifications[index].image,
                                          width: 200,
                                          //  height: 170,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child: Text(
                                            
                                            codifications[index].type,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 245, 232, 209),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, right: 100),
                                          child: Text(
                                            state.category[index].length.toString(),
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
                      ),
                    ]);
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
        ),
      ),
    );
  }
}

// List<Widget> Pages = [
//   medicines(),
 
// ];
// ListView.builder(
//                    itemCount: codifications.length,
//                    itemBuilder: (context, num) {
//                      return InkWell(
//                        onTap: () {
//                           Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return Pages[num];
//                      },
//                    ),
//                  );
//                        },
//                        child: Itme(Codification: codifications[num]));
//                    }),