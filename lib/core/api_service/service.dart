import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market/core/api_service/sensitive_data.dart';

class ApiService{
final Dio _dio =Dio(
  BaseOptions(
    baseUrl: "https://vuzloycexvznnevebnns.supabase.co/rest/v1/",
        headers: {"apikey":dotenv.env["SUPABASE_ANON_KEY"]}
  )
);
Future<Response> getData(String path)async{
  return await _dio.get(path);
}
Future<Response> postData(String path , Map<String,dynamic>data)async{
  return await _dio.post(path,data: data);

}
Future<Response> patchData(String path , Map<String,dynamic>data)async{
  return await _dio.patch(path,data: data);

}
Future<Response> delete(String path)async{
  return await _dio.delete(path);
}

}