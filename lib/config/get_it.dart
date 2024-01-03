import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt config = GetIt.instance;
GetIt IdUser =GetIt.instance;
setup()async{
  config.registerSingleton(await SharedPreferences.getInstance());
}
setup1()async{
  IdUser.registerSingleton(await SharedPreferences.getInstance());
}