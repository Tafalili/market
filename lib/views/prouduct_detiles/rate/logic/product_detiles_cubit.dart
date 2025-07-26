import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_service/service.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';
import 'package:meta/meta.dart';
part 'product_detiles_state.dart';

class product_detilesCubit extends Cubit<product_detilesState> {
  product_detilesCubit() : super(product_detilesInitial());
  final ApiService service = ApiService();
  int avaragerate = 0;
   List<Ratemodel> product_detiles_List = [] ;
   Future<void> getproduct_detiless({required String product_id}) async {
     emit(product_detilesLoding());
    try{
      emit(product_detilesLoding());
      Response response = await service.getData("rate?select=*&for_product=eq.$product_id");
      for(var product_detiles in response.data){
        product_detiles_List.add(Ratemodel.fromJson(product_detiles));
        for(var avrate in product_detiles_List){
          if(avrate.rate!=null){
            avaragerate += avrate.rate!.toInt();
          }
         avaragerate= avaragerate~/product_detiles_List.length;
        }
        emit(product_detilessuccess());


      }
    } catch(e){
      emit(product_detileserror());
      print(e);
    }

   }
}
