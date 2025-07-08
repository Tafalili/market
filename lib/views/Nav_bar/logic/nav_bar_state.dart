// nav_bar_state.dart
part of 'nav_bar_cubit.dart';

sealed class NavBarState {
  final int currentIndex;

  NavBarState(this.currentIndex);
}

class NavBarInitial extends NavBarState {
  NavBarInitial() : super(0); // Default to index 0
}

class NavOnChanged extends NavBarState {
  NavOnChanged(int index) : super(index);
}