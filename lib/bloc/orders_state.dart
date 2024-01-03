// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
class Loading extends OrdersState{}
class ConnectionErorr extends OrdersState{}
class NotFound extends OrdersState{}
class SuccessFetchorder extends OrdersState {
  List<getOrderModel> order;
  SuccessFetchorder({
    required this.order,
  });
  
}
class SuccessFetchOderDetails extends OrdersState {
  List<OrderDetailsModel> oderDetails;
  SuccessFetchOderDetails({
    required this.oderDetails,
  });
}
