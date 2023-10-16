import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.shopList:
        emit(NavigationState(NavBarItem.shopList, 1));
        break;
    }
  }
}
