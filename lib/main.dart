import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/view/convert_Coins.dart';
import 'package:coinexa_app/features/favorite/data/repo/repoImplement.dart';
import 'package:coinexa_app/features/favorite/presentation/StateManage/cubit/favorite_cubit.dart';
import 'package:coinexa_app/features/home/data/repo/home_repo.dart';
import 'package:coinexa_app/features/home/data/repo/home_repo_implement.dart';
import 'package:coinexa_app/features/home/presentation/mange_state/cubit/home_cubit_cubit.dart';
import 'package:coinexa_app/features/home/presentation/view/home_Screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeRepo homeRepo = HomeRepoImplement(ApiServes(Dio()));
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit()),
        BlocProvider<HomeCubitCubit>(
          create: (context) =>
              HomeCubitCubit(HomeRepoImplement(ApiServes(Dio())))
                ..featchTrending(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HomeScreen()),
        routes: {"convertpage": (context) => ConvertCoins()},
      ),
    );
  }
}
