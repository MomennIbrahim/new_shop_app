import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/layout/presentation/controller/categories_cubit/categories_cubit.dart';
import 'package:route_app/features/layout/presentation/screens/home_screen/widgets/loading_categories_list_view.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/custom_list_view.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesSuccessState) {
            return CustomListView(
              model: state.categoriesModel,
            );
          } else if (state is GetCategoriesFailureState) {
            return Center(child: Text(state.errMessage));
          } else {
            return const LoadingCategoriesListView();
          }
        },
      ),
    );
  }
}
