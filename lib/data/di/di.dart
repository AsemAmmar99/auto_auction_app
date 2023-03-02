import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/data/local/my_cache.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/router/app_router.dart';

final sl = GetIt.instance;

Future<void> initSL() async {
  sl.registerLazySingleton<AppRouter>(
        () => AppRouter(),
  );
  sl.registerLazySingleton<MyCache>(
        () => MyCache(),
  );
  sl.registerLazySingleton<AppCubit>(
        () => AppCubit(),
  );
}