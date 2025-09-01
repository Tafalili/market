part of 'favorate_cubit.dart';
@immutable
sealed class FavorateState {}

final class FavorateInitial extends FavorateState {}
class FavorateLoading extends FavorateState {}
 class FavorateSuccess extends FavorateState {}
 class FavorateError extends FavorateState {}


