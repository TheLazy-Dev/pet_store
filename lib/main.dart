import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/app/themes.dart';
import 'package:pet_store/presentation/bloc/cubit/history_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/home_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/search_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/theme_cubit.dart';
import 'app/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider<HistoryCubit>(
          create: (BuildContext context) => HistoryCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(builder: (context, state) {
        return MaterialApp(
          theme: context.read<ThemeCubit>().currentTheme == Themes.Light
              ? LightTheme.getTheme()
              : DarkTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: "/",
        );
      }),
    );
  }
}
