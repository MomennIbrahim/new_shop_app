import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/features/search/presentation/controller/search_cubit.dart';
import 'package:route_app/features/search/presentation/screens/widgets/search_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is GetSearchSuccessState){
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  SearchItem(searchModel: state.searchModel, index: index),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 5.0.h,),
              itemCount: state.searchModel.data!.data!.length,
            ),
          );
        }else if (state is GetSearchFailureState){
          return Center(child: Text(state.errMessage.toString()),);
        }else if (state is GetSearchLoadingState){
          return Center(child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: CircularProgressIndicator(strokeWidth: 1.8,color: kPrimaryColor,),
          ));
        }else{
          return Container();
        }
      },
    );
  }
}
