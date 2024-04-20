import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  late TabController tabController;

  void changeTab(String tab, context) {
    switch (tab) {
      case "Orders":
        tabController.animateTo(1);
        break;
      case "Home":
        tabController.animateTo(0);
        break;
      default:
    }
    emit(HomeLayoutChangeScreenState());
    debugPrint('index is ${tabController.index.toString()}');
  }

  String currentRoute = "";

  void changeRouts(String name) {
    currentRoute = name;
    debugPrint('changeRouts$currentRoute');
    emit(HomeLayoutChangeScreenState());
  }
}
