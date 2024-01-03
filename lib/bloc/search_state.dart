// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
class successFetchResultSearch extends SearchState {
  List<getSearchModel> result;  
  successFetchResultSearch({
    required this.result,
  });
 
}
class Loading extends SearchState{}
class ConnectionErorr extends SearchState{}
class NotFound extends SearchState{}