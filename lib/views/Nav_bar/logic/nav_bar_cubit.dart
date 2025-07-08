// nav_bar_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int currentIndex = 0; // Fixed typo: curentIndex -> currentIndex

  void changeIndex(int index) { // Renamed for clarity (changingIndex -> changeIndex)
    currentIndex = index;
    emit(NavOnChanged(index));
  }
}