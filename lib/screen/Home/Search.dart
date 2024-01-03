import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_warehouse/bloc/search_bloc.dart';
import 'package:medicine_warehouse/model/search_model.dart';
import 'package:shimmer/shimmer.dart';

class searchPage extends StatelessWidget {
  searchPage({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 245, 232, 209),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xffE1BB80),
              centerTitle: true,
              title: Text(
                'Be Healthy'.tr(),
                style: TextStyle(
                  color: Color.fromARGB(255, 37, 44, 88),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        color: Color(0xffE1BB80)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 5, top: 10),
                      child: TextField(
                        onChanged: (value) {
                          context.read<SearchBloc>().add(Search(word: searchModel(name: value)));
                        },
                        controller: search,
                        decoration: InputDecoration(
                            label: Row(
                              children: [
                                Icon(Icons.search,
                                    color: Color.fromARGB(255, 37, 44, 88)),
                                Text(
                                  'Search'.tr(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 37, 44, 88)),
                                )
                              ],
                            ),
                            // icon:Icon(Icons.search) ,
                            // error: ErrorWidget(Text('gfbgf')),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(25)
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 37, 44, 88),
                                ),
                                borderRadius: BorderRadius.circular(25)),
                            // contentPadding: EdgeInsets.symmetric(horizontal: ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 37, 44, 88),
                                ),
                                borderRadius: BorderRadius.circular(25)),
                            hintText: 'Search'.tr(),
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 37, 44, 88))),
                      ),
                    ),
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is successFetchResultSearch) {
                        return Expanded(
                          
                          child: ListView.builder(
                            itemCount: state.result.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: ExpansionTile(
                                    title: Text(
                                      'commercial name : '.tr()+state.result[index].commercial_name,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 245, 232, 209),
                                          fontSize: 18),
                                    ),
                                    leading: Icon(Icons.medication,
                                        color: Color.fromARGB(255, 245, 232, 209)),
                                    backgroundColor:
                                        Color.fromARGB(255, 37, 44, 88),
                                    collapsedBackgroundColor:
                                        Color.fromARGB(255, 37, 44, 88),
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Scientific Name : '.tr()+state.result[index].scientific_name,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      // Text(
                                      //   'Category'.tr(),
                                      //   style: TextStyle(
                                      //       color:
                                      //           Color.fromARGB(255, 245, 232, 209),
                                      //       fontSize: 17,
                                      //       fontWeight: FontWeight.w400),
                                      // ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Text(
                                        'Manufacture Company : \n'.tr()+state.result[index].manufacture_company,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Quantity Available : '.tr()+state.result[index].quantity_available.toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Expiration Date : '.tr()+state.result[index].expiration_date,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Price : '.tr()+state.result[index].price.toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 245, 232, 209),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                    //  style:ListTileStyle.list ,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      } else if (state is Loading) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: 10, // Number of ListTiles to display
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.grey,
                                child: ListTile(
                                  leading: const CircleAvatar(),
                                  title: Container(
                                    width: double.infinity,
                                    height: 16.0,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    width: double.infinity,
                                    height: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state is ConnectionErorr) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 220),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 50,
                              color: Colors.blueGrey,
                            ),
                          ),
                        );
                      } else if (state is NotFound) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 220),
                          child: Center(
                            child: Text('The medicine is not found'),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 220),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 50,
                              color: Colors.blueGrey,
                            ),
                          ),
                        );
                      }
                    },
                  )
                ]),
          );
        }
      ),
    );
  }
}
