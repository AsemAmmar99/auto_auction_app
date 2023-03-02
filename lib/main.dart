import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/data/local/my_cache.dart';
import 'package:auto_auction_app/presentation/router/app_router.dart';
import 'package:auto_auction_app/presentation/styles/colors.dart';
import 'package:auto_auction_app/presentation/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'constants/bloc_observer.dart';
import 'data/di/di.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initSL();
  await sl<MyCache>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => sl<AppCubit>()..createDatabase(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              sl<AppCubit>().getAppTheme();
              return MaterialApp(
                title: 'Auto Auction',
                debugShowCheckedModeBanner: false,
                theme: sl<AppCubit>().isDarkTheme
                ? Themes.darkTheme
                : Themes.lightTheme,
                onGenerateRoute: sl<AppRouter>().onGenerateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
