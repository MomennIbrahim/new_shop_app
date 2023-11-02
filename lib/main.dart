import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/utils/local_storage.dart';
import 'package:route_app/features/cart/data/repository/cart_repository_implementation.dart';
import 'package:route_app/features/cart/presentation/controller/cart_cubit.dart';
import 'package:route_app/features/categories/data/repository/categories_repository_implementation.dart';
import 'package:route_app/features/favorite/data/repository/favorite_repository_implementation.dart';
import 'package:route_app/features/person/data/repository/person_repository_implementation.dart';
import 'package:route_app/features/splash/splash_screen.dart';
import 'core/bloc_observe.dart';
import 'core/utils/servic_locator.dart';
import 'features/categories/presentation/controller/categories_cubit/categories_cubit.dart';
import 'features/favorite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'features/home/data/repository/home_repositories_implementation.dart';
import 'features/home/presentation/controller/banner_cubit/banner_cubit.dart';
import 'features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'features/home/presentation/controller/sub_categories_cubit/sub_categories_cubit.dart';
import 'features/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'features/person/presentation/controller/person_cubit/person_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  Bloc.observer = MyBlocObserver();

  setupServiceLocator();

  token = await LocalStorage.getData(key: 'token');
  print(token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) =>
              BannerCubit(getIt.get<HomeRepositoriesImplementation>())
                ..getBannerData()
        ),
        BlocProvider(
            create: (context) =>
            CategoriesCubit(getIt.get<CategoriesRepositoryImplementation>())
              ..getCategoriesData()
        ),
        BlocProvider(
            create: (context) =>
            SubCategoriesCubit(getIt.get<HomeRepositoriesImplementation>())
              ..getSubCategoriesData()
        ),
        BlocProvider(
            create: (context) =>
            ProductCubit(getIt.get<HomeRepositoriesImplementation>())
              ..getProductData()
        ),
        BlocProvider(
            create: (context) =>
            FavoriteCubit(getIt.get<FavoriteRepositoryImplementation>())
              ..getFavoriteData()
        ),
        BlocProvider(
            create: (context) =>
            PersonCubit(getIt.get<PersonRepositoryImplementation>())
              ..getPersonData()
        ),
        BlocProvider(
            create: (context) =>
            CartCubit(getIt.get<CartRepositoriesImplementation>())
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_,child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: kPrimaryColor,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: kPrimaryColor
              )
            )
            // primarySwatch: MaterialColor(0xff004182, {
            //   50:kPrimaryColor,
            //   100:kPrimaryColor,
            //   200:kPrimaryColor,
            //   300:kPrimaryColor,
            //   400:kPrimaryColor,
            //   500:kPrimaryColor,
            //   600:kPrimaryColor,
            //   700:kPrimaryColor,
            //   800:kPrimaryColor,
            //   900:kPrimaryColor,
            // })
          ),
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
