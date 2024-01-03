import 'package:bloc/bloc.dart';
import 'package:medicine_warehouse/model/categoey2_model.dart';
import 'package:medicine_warehouse/model/category_model.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';
import 'package:medicine_warehouse/model/warehouse_model.dart';
import 'package:medicine_warehouse/service/Post_medicines.dart';
import 'package:medicine_warehouse/service/get_warehouse.dart';
import 'package:meta/meta.dart';

part 'medicines_event.dart';
part 'medicines_state.dart';

class MedicinesBloc extends Bloc<MedicinesEvent, MedicinesState> {
  MedicinesBloc() : super(MedicinesInitial()) {
    on<Getwarehouse>((event, emit) async {
      emit(Loading());
      dynamic temp;
      List<warehouse_model> all_warehouse = [];
        try {
        temp = await get_warehouse();
        // print(temp);
        all_warehouse = List.generate(
            temp.length, (index) => warehouse_model.fromMap(temp[index]));

         print(all_warehouse);

        if (all_warehouse.isEmpty) {
          emit(NotFound());
        } else {
          emit(SuccessFetchWarehouse(WareHousename: all_warehouse));
        }
        } catch (e) {
          emit(ConnectionErorr());
        }
    });
    on<GetCtegory>((event, emit) async {
      emit(Loading());
      dynamic temp;
      List<List> result = [];
      try {
        print(event.IdWareHouse);
        temp = await post_medicines(event.IdWareHouse);
        //  print(temp);
        result = List.generate(
            temp.length,
            (index) => temp[index]);

        // print(result[0]);
        if (result.isEmpty) {
          emit(NotFound());
        } else {
          emit(SuccessFetchMedicines(category: result));
        }
      } catch (e) {
        print(e);
        // emit(ConnectionErorr());
      }
    });
  }
}
