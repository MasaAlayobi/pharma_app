import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/model/codification.dart';
import 'package:medicine_warehouse/model/item.dart';
import 'package:medicine_warehouse/screen/Home/Favorite.dart';
import 'package:medicine_warehouse/screen/Home/order/Order.dart';
import 'package:medicine_warehouse/screen/Home/Search.dart';
import 'package:medicine_warehouse/screen/Home/category_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_Page extends StatefulWidget {
  Home_Page({super.key, required this.idWarehouse});

  final int idWarehouse;

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<codification> codifications = const [
    codification('Pain Killers', 'assets/PK.jpg'),
    codification('Inflammation', 'assets/PK.jpg'),
    codification('Immunomodulatory \n Medications', 'assets/PK.jpg'),
    codification('Dermatological \n Medications', 'assets/PK.jpg'),
    codification('Hormonedisorders \n Medications', 'assets/PK.jpg')
  ];
  // text =T;
  late List psges;

  @override
  void initState() {
    psges = [
      category_page(id2: widget.idWarehouse),
      searchPage(),
      orderPage(idWarehouse: widget.idWarehouse, idUser:int.tryParse(config.get<SharedPreferences>().getString('IdUser')!) !),
      favoritePage()
    ];
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(config.get<SharedPreferences>().getString('token'));
    return Scaffold(
      backgroundColor: Colors.white,
      body: psges[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        // selectedItemColor: Color(0xff22333B),
        // showSelectedLabels:true,
        // animationDuration: Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        //  showUnselectedLabels: true,
        // unselectedLabelStyle: TextStyle(color: Color(0xff22333B)),
        //  selectedLabelStyle: TextStyle(color: Color(0xff22333B)),
        // mouseCursor:MaterialStateMouseCursor.clickable,
        backgroundColor: Color(0xffE1BB80),
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
              // tooltip: 'Aliqua ad elit pariatur labore.',
              icon: Icon(Icons.home, color: Color.fromARGB(255, 37, 44, 88)),
              label: 'Home'.tr(),
              selectedIcon:
                  Icon(Icons.home, color: Color.fromARGB(255, 37, 44, 88))),
          NavigationDestination(
              icon: Icon(Icons.search, color: Color.fromARGB(255, 37, 44, 88)),
              label: 'Search'.tr()),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart,
                  color: Color.fromARGB(255, 37, 44, 88)),
              label: 'Order'.tr()),
          NavigationDestination(
              icon:
                  Icon(Icons.favorite, color: Color.fromARGB(255, 37, 44, 88)),
              label: 'favorite'.tr())
        ],
        // items: [
        //   BottomNavigationBarItem(
        //        backgroundColor: Color(0xffE1BB80),
        //     label: 'Home',
        //     icon: Icon(Icons.home,color: Color(0xff22333B),)
        //   ),
        //   BottomNavigationBarItem(
        //      backgroundColor: Color(0xffE1BB80),

        //     label: 'Search',
        //     icon: Icon(Icons.search,color: Color(0xff22333B),)
        //   ),
        //   BottomNavigationBarItem(
        //       backgroundColor: Color(0xffE1BB80),
        //     label: 'Order',
        //     icon: Icon(Icons.shop,color: Color(0xff22333B),)
        //   ),
        //   BottomNavigationBarItem(
        //       backgroundColor: Color(0xffE1BB80),
        //     label: 'favorite',
        //     icon: Icon(Icons.shopping_cart,color:Color(0xff22333B),)
        //   ),
        // ]
      ),
    );
  }
}
