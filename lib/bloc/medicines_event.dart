// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'medicines_bloc.dart';

@immutable
sealed class MedicinesEvent {}
class Getwarehouse extends MedicinesEvent{
}
class GetCtegory extends MedicinesEvent {
  int IdWareHouse;
  GetCtegory({
    required this.IdWareHouse,
  });
}
