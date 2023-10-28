import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';
import 'package:route_app/features/layout/presentation/screens/category_screen/category_screen.dart';
import '../../screens/favorite_screen/favorite_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/person_screen/person_screen.dart';
import 'layout_state.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context)=>BlocProvider.of(context);


  List<Widget> screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
     PersonScreen(),
  ];

  int currentIndex = 0 ;

  void changeBottomNavigation({required int index}){
    currentIndex = index;
    emit(ChangeNavigationBarState());
  }

}
