// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'medicines_bloc.dart';

@immutable
sealed class MedicinesState {}

final class MedicinesInitial extends MedicinesState {}
class SuccessFetchWarehouse extends MedicinesState {
  List<warehouse_model> WareHousename;
  SuccessFetchWarehouse({
    required this.WareHousename,
  });
}
class Loading extends MedicinesState{}
class ConnectionErorr extends MedicinesState{}
class NotFound extends MedicinesState{}
class SuccessFetchMedicines extends MedicinesState {
  List category;
  SuccessFetchMedicines({
    required this.category,
  });
}
