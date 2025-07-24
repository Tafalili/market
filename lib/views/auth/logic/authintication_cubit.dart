import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/core/components/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authintication_state.dart';

class AuthinticationCubit extends Cubit<AuthinticationState> {
  AuthinticationCubit() : super(AuthinticationInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> Login({required String email, required String password}) async {
    emit(Login_Loading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      await FetchData();
      emit(Login_Success());
    } on AuthException catch (e) {
      emit(Login_Error(e.message));
    }
  }

  Future<void> SignUp({required String name,
    required String email,
    required String password}) async {
    emit(Login_Loading());
    try {
      await client.auth.signUp(password: password, email: email);
      await FetchData();
      emit(Login_Success());
      SendingData(email: email,name: name);
    } on AuthException catch (e) {
      emit(Login_Error(e.message));
    }
  }


  Future<void> nativeGoogleSignIn() async {
    emit(GoogleSinInLoading());
    try {
      const webClientId = '503210863886-dnsb6ifi57vqq9vhgfcafg7bdn286keu.apps.googleusercontent.com';
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google Sign-In canceled by user.';
      }
      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null || idToken == null) {
        throw 'No Access Token or ID Token found.';
      }
      await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      await SendingData(name:googleUser.displayName! ,email:googleUser.email );
      await FetchData();
      emit(GoogleSinInSuccess());
    } catch (e, stack) {
      print("Google Sign-In Error: $e");
      print(stack); // يطبع Stack Trace للتشخيص الأدق
      emit(GoogleSinInError(e.toString()));
    }
  }


  Future <void> SignOut() async {
    emit(LogOutLoading());
    try {
      await client.auth.signOut();
      emit(LogOutSuccess());
    } catch (e) {
      print("Google Sign-Out Error: $e");

      emit(LogOutError());
    }
  }

  Future <void> ResetPassword(String Email) async {
    try {
      emit(ResetPasswordLoading());

      await client.auth.resetPasswordForEmail(Email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      print("there are error in reset password $e");
      emit(ResetPasswordError());
    }
  }

  Future <void> SendingData({required String name , required String email})async{
    emit(SendingDataLoading());
    try{
      await client
          .from('users')
          .upsert({'user_id':client.auth.currentUser!.id,'name': name, 'email': email});
      emit(SendingDataSuccess());
    } catch(e){
      print("sending data error : $e");

    }
  }
  GetUserModel?userModel;
  Future<void> FetchData() async{
    emit(FetchDataLoading());
try {
 final data= await client
      .from('users')
      .select().eq("user_id", "d957a073-057d-4a61-babb-4d37878cf847");
userModel=GetUserModel(name:data[0]["name"] , email:data[0]["email"] , id:data[0]["user_id"] );
 print(userModel.toString());
 emit(FetchDataSuccess());
} catch(e){
  emit(FetchDataLoading());
}
  }
}
