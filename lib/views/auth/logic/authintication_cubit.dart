import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authintication_state.dart';

class AuthinticationCubit extends Cubit<AuthinticationState> {
  AuthinticationCubit() : super(AuthinticationInitial());

  SupabaseClient client  = Supabase.instance.client;

 Future<void> Login ({required String email, required String password})async {
emit(Login_Loading());
   try{
  await client.auth.signInWithPassword(password: password,email: email);
   emit(Login_Success());
   } on AuthException

   catch(e){
emit(Login_Error(e.message));

   }
 }

  Future<void> SignUp ({ required String name,required String email, required String password})async {
    emit(Login_Loading());
    try{
      await client.auth.signUp(password: password,email: email);
      emit(Login_Success());
    } on AuthException

    catch(e){
      emit(Login_Error(e.message));

    }
  }
}
