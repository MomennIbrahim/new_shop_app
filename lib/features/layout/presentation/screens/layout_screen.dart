import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/bottom_navigation.dart';
import '../controller/layout_cubit/layout_cubit.dart';
import '../controller/layout_cubit/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            child: CustomBottomNavBar(),
          ),
          body: LayoutCubit.get(context)
              .screen[LayoutCubit.get(context).currentIndex],
        );
      },
    );
  }
}
