import 'package:dio/dio.dart';
import 'package:medicine_warehouse/main.dart';
import 'package:medicine_warehouse/model/all_medicines_model.dart';
import 'package:medicine_warehouse/model/category_model.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';

final List<String> codifications = [
  'Pain Killers',
  'Inflammation',
  'Immunomodulatory Medications',
  'Dermatological Medications',
  'Hormonedisorders  Medications',
];

late List<CategoryModel> all_result = [];

// Future<List<CategoryModel>>
 post_medicines(int id) async {
//  try{
  Dio dio = Dio();
  Response response = await dio.get(
    '${baseURl}/warehousesMedicines/$id',
    //  data: .toJson(),
    options: Options(
      headers: {'Accept': 'application/json'},
    ),
  );
  if (response.statusCode == 200) {
    //  Map<String,Map<String,medicines_model>> medicines_data = {};
    // dynamic temp = response.data["data"];
    // int index = 0;
    // codifications.forEach((element) {
    //     index = index + 1;
    //   print('-------------------------------------------');
    //   temp[element].values.forEach((e) {
    //       // if (e != null) {
    //     //   // CategoryModel result =
    //     //   //     CategoryModel(category_name: element, AllMediciesInCategory: [
    //     //   //   AllMedicies(allMedicies: [medicines_model.fromMap(e)])
    //     //   // ]);
    //     //   // all_result.add(result);
    //     //  print(e);
    //     //    index = index+5 ;
        
    //   //  }

    //     all_result = List.generate(
    //       temp.keys.length,
    //       (num) => CategoryModel(
    //         category_name: temp.keys.elementAt(num),
    //         AllMediciesInCategory: List.generate(
    //           temp.values.elementAt(num).keys.length,
    //      (ind) => medicines_model
    //     .fromMap(temp.values.elementAt(num).values.elementAt(ind)),
    //         ),
    //       ),
    //     );
    //     //  index = index + 1;
    //     // print(temp.values.elementAt(1).keys.elementAt(1));
    //     // all_result = List.generate(
    //     //   temp.keys.length,
    //     //   (index) => CategoryModel(
    //     //     category_name: temp.keys.elementAt(index),
    //     //     AllMediciesInCategory: List.generate(
    //     //       temp.values.elementAt(index).keys.length,
    //     //       (ind) => AllMedicies(
    //     //         id: temp.values.elementAt(index).keys.elementAt(ind).toString(),
    //     //         allMedicies: List.generate(
    //     //           temp.values
    //     //               .elementAt(index)
    //     //               .values
    //     //               .elementAt(ind)
    //     //               .keys
    //     //               .length,
    //     //           (num) => medicines_model.fromMap(temp.values
    //     //               .elementAt(index)
    //     //               .values
    //     //               .elementAt(ind)
    //     //               ),
    //     //         ),
    //     //       ),
    //     //     ),
    //     //   ),
    //     // );
    //   });
    //   print('??????????????????????????????????????????');
    //   //  all_result.forEach((element) {
    //     print(all_result[1]);
    //     print('--------------------------------------------------');
    //   // });
    //   // all_result[0].AllMediciesInCategory[0].allMedicies.length;
    // });
    //  print(all_result);
    //  print(response.data[0]);
    return response.data;
  } else {
    print('error');
  }
  // return [];
  // //  }
  //  catch(e){
  //   return false;
  //  }
}
