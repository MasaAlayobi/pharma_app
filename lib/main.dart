import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_warehouse/bloc/medicines_bloc.dart';
import 'package:medicine_warehouse/bloc/orders_bloc.dart';
import 'package:medicine_warehouse/bloc/search_bloc.dart';
import 'package:medicine_warehouse/config/get_it.dart';
import 'package:medicine_warehouse/config/observe.dart';
import 'package:medicine_warehouse/provider/favorite_provider.dart';
import 'package:medicine_warehouse/provider/order_provider.dart';
import 'package:medicine_warehouse/screen/Home/Home_Page.dart';
import 'package:medicine_warehouse/screen/Start.dart';

import 'package:medicine_warehouse/screen/Home/category_page.dart';
import 'package:medicine_warehouse/screen/Warehouse.dart';
import 'package:medicine_warehouse/screen/medicines/medication_details.dart';
import 'package:medicine_warehouse/screen/medicines/medicines_page.dart';
import 'package:medicine_warehouse/service/get_warehouse.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  // setup1();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translation', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

String baseURl  = 'https:';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => orderProvider(),
          ),
          ChangeNotifierProvider(create: (context)=>favoriteProvider())
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            theme: ThemeData(colorSchemeSeed: Colors.amber),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home:Start()
          );
        }));
  }
}
//  MultiBlocProvider(
//               providers: [
//                 BlocProvider(
//                     create: (context) => MedicinesBloc()),
//                  BlocProvider(create: (context)=>OrdersBloc()),
//                 //BlocProvider(create: (context)=>SearchBloc())    
//               ],
//               child:Start(),
//             ),