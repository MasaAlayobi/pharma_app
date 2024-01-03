// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}
class FetchOrders extends OrdersEvent {
 int idUser;
  FetchOrders({
    required this.idUser,
  });
}
class FetchOrderDetails extends OrdersEvent {
  int idOrder;
  FetchOrderDetails({
    required this.idOrder,
  });
}
