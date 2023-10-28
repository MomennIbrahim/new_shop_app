import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constance.dart';
import '../../controller/layout_cubit/layout_cubit.dart';
import '../../controller/layout_cubit/layout_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<BottomNavigationBarItem> items = [
          bottomNavBarItem(
              isSelect:
                  LayoutCubit.get(context).currentIndex == 0 ? true : false,
              iconData: Icons.home_outlined,
              label: 'Home',
              toolTip: 'Home'),
          bottomNavBarItem(
              isSelect:
                  LayoutCubit.get(context).currentIndex == 1 ? true : false,
              iconData: Icons.category_outlined,
              label: 'Category',
              toolTip: 'Category'),
          bottomNavBarItem(
              isSelect:
                  LayoutCubit.get(context).currentIndex == 2 ? true : false,
              iconData: Icons.favorite_border_outlined,
              label: 'Favorite',
              toolTip: 'Favorite'),
          bottomNavBarItem(
              isSelect:
                  LayoutCubit.get(context).currentIndex == 3 ? true : false,
              iconData: Icons.person_outline,
              label: 'Person',
              toolTip: 'Person'),
        ];

        var layoutCubit = LayoutCubit.get(context);

        return BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.fixed,
          onTap: (i) {
            layoutCubit.changeBottomNavigation(index: i);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: kPrimaryColor,
          currentIndex: layoutCubit.currentIndex,
          unselectedItemColor: Colors.white,
        );
      },
    );
  }

  BottomNavigationBarItem bottomNavBarItem({
    required bool isSelect,
    required IconData iconData,
    required String label,
    required String toolTip,
  }) {
    return isSelect
        ? BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(iconData),
            ),
            tooltip: toolTip,
            label: label,
          )
        : BottomNavigationBarItem(
            icon: Icon(iconData),
            tooltip: toolTip,
            label: label,
          );
  }
}
