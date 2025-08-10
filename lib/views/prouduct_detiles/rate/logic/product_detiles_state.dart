part of 'product_detiles_cubit.dart';

@immutable
sealed class product_detilesState {}

final class product_detilesInitial extends product_detilesState {}


final class product_detilesLoding extends product_detilesState{}
final class product_detilessuccess extends product_detilesState{}
final class product_detileserror extends product_detilesState{}

final class update_rate_loading extends product_detilesState{}
final class update_rate_success extends product_detilesState{}
final class update_rate_error extends product_detilesState{}



