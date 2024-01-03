import 'package:bloc/bloc.dart';
import 'package:medicine_warehouse/model/get_order_Model.dart';
import 'package:medicine_warehouse/model/get_search_model.dart';
import 'package:medicine_warehouse/model/search_model.dart';
import 'package:medicine_warehouse/service/search_service.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<Search>((event, emit) async{
     emit(Loading());
     dynamic temp=await post_search(event.word);
     List<getSearchModel> all_result=[];
     try{
      all_result=List.generate(temp.length, (index) =>getSearchModel.fromMap(temp[index]) );
      if(all_result.isEmpty){
        emit(NotFound());
      }else{
        emit(successFetchResultSearch(result: all_result));
      }
     }catch(e){
       emit(ConnectionErorr());
     }
    });
  }
}