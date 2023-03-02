part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppCreateDatabaseState extends AppState {}

class AppGetMyBidsLoadingState extends AppState {}

class AppInsertBidState extends AppState {}

class AppEditBidAmountState extends AppState {}

class AppDeleteBidState extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class ChangeAppThemeState extends AppState {}
