import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/api_service/service.dart';
import 'favorate_model.dart';

part 'favorate_state.dart';  // Make sure this line is present

class FavorateCubit extends Cubit<FavorateState> {
  FavorateCubit() : super(FavorateInitial());
  ApiService service = ApiService();
  List<FavorateModel> favorat_status = [];
  List<dynamic> data = [];

  Future<void> getFavStatus({required String productID}) async {
    String user_id = Supabase.instance.client.auth.currentUser!.id;
    emit(FavorateLoading());
    try {
      Response response = await service.getData("favorate?select=*&for_user=eq.$user_id&for_product=eq.$productID");
      data = response.data;
      for (var fav_data in data) {
        favorat_status.add(FavorateModel.fromJson(fav_data));
      }
      emit(FavorateSuccess());  // Move this outside the loop
    } catch(e) {
      emit(FavorateError());
    }
  }
}