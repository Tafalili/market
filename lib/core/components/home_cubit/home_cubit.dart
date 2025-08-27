import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_service/service.dart';
import 'package:meta/meta.dart';

import '../prodacts_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiService _services = ApiService();
  List<dynamic> data = []; // Store API data
   List<ProdactsModel> product=[];
  List<ProdactsModel> searchResult=[];


  Future<void> getDataSupa({String?quiry}) async {
    emit(LoadingProdict());
    try {
      var response = await _services.getData("products?select=*,favorate(*)),purchase(*)");
      data = response.data;
for(var prod in data ){
  product.add(ProdactsModel.fromJson(prod));
  }
      search(quiry!);
  emit(SuccesProdict());
    } catch (e) {
      print("Error details: $e");
      if (e is DioException) {
        print("DioException: ${e.response?.statusCode}, ${e.response?.data}");
      }
      emit(ErrorProdict());
    }
  }
  void search(String quiry) async {
    if(quiry != null){
      for(var product_item in product){
        if(product_item.productName!.toLowerCase().contains(quiry.toLowerCase())){
          searchResult.add(product_item);
        }
      }
    }
  }
}