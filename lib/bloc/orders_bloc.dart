import 'package:bloc/bloc.dart';
import 'package:medicine_warehouse/bloc/medicines_bloc.dart';
import 'package:medicine_warehouse/model/Order_Details_model.dart';
import 'package:medicine_warehouse/model/get_order_Model.dart';
import 'package:medicine_warehouse/service/order_service.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrders>((event, emit)async {
      emit(Loading());
      dynamic temp= await getAllOrder(event.idUser);
      List<getOrderModel> allOrders=[];
       try{
      allOrders=List.generate(
            temp.length, (index) => getOrderModel.fromMap(temp[index]));
            print(allOrders);
        if(allOrders.isEmpty){
          emit(NotFound());
        }    
        else{
          emit(SuccessFetchorder(order: allOrders));
        }
       }catch(e){
 emit(ConnectionErorr());
       }
    });
    on<FetchOrderDetails>((event, emit) async{
      emit(Loading());
      dynamic temp=await getOrderDetails(event.idOrder);
      List<OrderDetailsModel> oderDetails=[];
       try{
        oderDetails=List.generate(temp.length, (index) => OrderDetailsModel.fromMap(temp[index]));
        print(oderDetails);
 if (oderDetails.isEmpty){
  emit(NotFound());
 }
 else{
  emit(SuccessFetchOderDetails(oderDetails: oderDetails));
 }
       }
       catch(e){
         emit(ConnectionErorr());
       }
    });
  }
}
