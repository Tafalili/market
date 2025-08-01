import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_service/service.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'product_detiles_state.dart';

class product_detilesCubit extends Cubit<product_detilesState> {
  product_detilesCubit() : super(product_detilesInitial());
  final ApiService service = ApiService();
  int avaragerate = 0;
  List<Ratemodel> product_detiles_List = [];
  num rateUser = 5;

  Future<void> getproduct_detiless({required String product_id}) async {
    emit(product_detilesLoding());
    try {
      Response response = await service.getData("rate?select=*&for_product=eq.$product_id");
      print("API Response Data: ${response.data}");

      product_detiles_List.clear(); // Clear list to avoid duplicates
      for (var product_detiles in response.data) {
        product_detiles_List.add(Ratemodel.fromJson(product_detiles));
      }
      print("product_detiles_List: $product_detiles_List");

      // Calculate average rate
      for (var avrate in product_detiles_List) {
        if (avrate.rate != null) {
          avaragerate += avrate.rate!.toInt();
        }
      }
      if (product_detiles_List.isNotEmpty) {
        avaragerate = avaragerate ~/ product_detiles_List.length;
      }
      print("Average Rate: $avaragerate");

      print("Current User ID: ${Supabase.instance.client.auth.currentUser!.id}");
      List<Ratemodel> rateUsers = product_detiles_List.where((Ratemodel rate) => rate.forUser == Supabase.instance.client.auth.currentUser!.id).toList();
      print("rateUsers: ${rateUsers.length}");
      if (rateUsers.isNotEmpty) {
        rateUser = rateUsers[0].rate!;
        print("the rate user is: $rateUser");
        emit(product_detilessuccess());


      } else {
        print("No matching rate found for the current user.");
      }

    } catch (e) {
      emit(product_detileserror());
      print("Error: $e");
    }
  }
}