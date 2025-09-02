part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class LoadingProdict extends HomeState{}
class SuccesProdict extends HomeState{}
class ErrorProdict extends HomeState{}


class LoadingFav extends HomeState{}
class SuccesFav extends HomeState{}
class ErrorFav extends HomeState{}
