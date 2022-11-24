import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/business_logic/cubit/global_cubit.dart';
import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/data/API/ApiServices.dart';
import 'package:world_cup/data/repository/app_repository.dart';
import 'package:world_cup/helper/router.dart';
import 'package:world_cup/helper/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(
          create: (context) => GlobalCubit(),
        ),
        BlocProvider(
          create: (context) => ServicesCubit(
            AppRepository(apiServices: APIServices()),
          ),
        ),
      ],
      child:  MaterialApp(
        theme: ThemeData(

        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.layout,
      ),
    );
  }
}
