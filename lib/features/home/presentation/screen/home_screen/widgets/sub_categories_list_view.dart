import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/layout/presentation/screens/widgets/custom_list_view.dart';
import '../../../controller/sub_categories_cubit/sub_categories_cubit.dart';
import 'loading_categories_list_view.dart';

class SubCategoriesListView extends StatelessWidget {
  const SubCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          if (state is GetSubCategoriesSuccessState) {
            return CustomListView(
              model: state.categoriesModel,
               );
          } else if (state is GetSubCategoriesFailureState) {
            return Center(child: Text(state.errMessage.toString()));
          } else {
            return const LoadingCategoriesListView();
          }
        },
      ),
    );
  }
}
