import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_service/service.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../prodacts_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiService _services = ApiService();
  List<dynamic> data = []; // Store API data
  List<ProdactsModel> product = [];
  List<ProdactsModel> searchResult = [];
  List<ProdactsModel> catigoryView = [];
  List favorateList = [];

  Future<void> getDataSupa({String? quiry, String? categoryitem ,String?productId}) async {
    emit(LoadingProdict());
    try {
      var response = await _services.getData("products?select=*,favorate(*)),purchase(*)");
      data = response.data;



      for (var prod in data) {
        product.add(ProdactsModel.fromJson(prod));
      }

      // Only call search if quiry is not null and not empty
      if (quiry != null && quiry.isNotEmpty) {
        search(quiry);
      }

      // Only call category if categoryitem is not null and not empty
      if (categoryitem != null && categoryitem.isNotEmpty) {
        category(categoryitem);
      }

      emit(SuccesProdict());
    } catch (e) {
      print("Error details: $e");
      if (e is DioException) {
        print("DioException: ${e.response?.statusCode}, ${e.response?.data}");
      }
      emit(ErrorProdict());
    }
  }

  void search(String quiry) {
    searchResult.clear(); // Clear previous results
    for (var product_item in product) {
      if (product_item.productName != null &&
          product_item.productName!.toLowerCase().contains(quiry.toLowerCase())) {
        searchResult.add(product_item);
      }
    }
  }

  void category(String category) {
    catigoryView.clear(); // Clear previous results
    for (var product_item in product) {
      if (product_item.category != null &&
          product_item.category!.trim().toLowerCase() == category.trim().toLowerCase()) {
        catigoryView.add(product_item);
      }
    }
  }
  void favorate({required String productID}) async {

 try{
   emit(LoadingFav());
   await _services.postData("favorate",{"is_favorate":true,"for_user":Supabase.instance.client.auth.currentUser!.id,"for_product":productID} );
   emit(SuccesFav());
 }catch(e){
   emit(ErrorFav());
   print(e);
 }

  }
}