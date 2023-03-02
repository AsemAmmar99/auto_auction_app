import 'package:auto_auction_app/presentation/screens/my_bids/my_bids_screen.dart';
import 'package:auto_auction_app/presentation/screens/offered_for_auction/offered_for_auction_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants/my_cache_keys.dart';
import '../../data/di/di.dart';
import '../../data/local/my_cache.dart';
import '../../data/models/car_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  // Handling Bottom Navigation Bar
  int currentIndex = 0;

  List<Widget> screens = [
    const OfferedForAuctionScreen(),
    const MyBidsScreen(),
  ];

  List<String> appBarTitles = [
    'Offered For Auction',
    'My Bids',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  // Theme Settings
  bool isDarkTheme = false;

  void changeAppTheme() {
    isDarkTheme = !isDarkTheme;
    sl<MyCache>().putBoolean(key: MyCacheKeys.theme, value: isDarkTheme);
    emit(ChangeAppThemeState());
  }

  void getAppTheme() {
    isDarkTheme = sl<MyCache>().getBoolean(key: MyCacheKeys.theme);
  }

  // sqflite Code for My Bids List
  List<Map> myBidsList = [];

  late Database database;

  void createDatabase() {
    openDatabase(
      'bids.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }
        database.execute('CREATE TABLE bids (id INTEGER PRIMARY KEY, carName TEXT, carImage TEXT, bidAmount TEXT, endDate TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('table created');
          }
        }).catchError((error){
          if (kDebugMode) {
            print('Error while creating table $error');
          }
        });
      },
      onOpen: (database){
        getMyBids(database);
        if (kDebugMode) {
          print('database opened');
        }
      }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    },
    );

  }

  void getMyBids(Database database) async {
    myBidsList = [];

    emit(AppGetMyBidsLoadingState());

    await database.rawQuery('SELECT * FROM bids').then((value) {
      for (var element in value) {
        myBidsList.add(element);
      }
    });
  }

  void insertToDatabase({
    required String carName,
    required String carImage,
    required String bidAmount,
  }) async {
    await database.transaction((txn) {
      String endDate = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day + 2).toString();
      return txn.rawInsert('INSERT INTO bids(carName, carImage, bidAmount, endDate) VALUES("$carName", "$carImage", "$bidAmount", "$endDate")')
      .then((value) {
        if (kDebugMode) {
          print('bid $value successfully inserted!');
        }
        emit(AppInsertBidState());

        getMyBids(database);
      }).catchError((error){
        if (kDebugMode) {
          print('Error while inserting bid $error');
        }
      });
    });
  }

  void editBidAmount({
    required String bidAmount,
    required int id,
  }) async {
    String endDate = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 2).toString();
    database.rawUpdate('UPDATE bids SET bidAmount = ?, endDate = ? WHERE id = ?',
      [bidAmount, endDate, id],
    ).then((value) {
      getMyBids(database);
      emit(AppEditBidAmountState());
    });
  }

  Future<void> deleteBid({
    required int id,
  }) async {
    await database.rawDelete('DELETE FROM bids WHERE id = ?',
    [id],
    ).then((value) {
      getMyBids(database);
      emit(AppDeleteBidState());
    });
  }

  // Local Data List
  List<CarModel> carsList = [
    CarModel(
        'Land Rover Range Rover Evoque',
        'https://www.cars-data.com/webp/thumbs/350px/land-rover/land-rover-range-rover-evoque_3187_1.webp',
        '150',
        '500',
        '600',
        'Sport',
        '4.5',
        '1-4',
        '1-3'),
    CarModel(
        'Jaguar E-Pace',
        'https://www.cars-data.com/webp/thumbs/350px/jaguar/jaguar-e-pace_4206_1.webp',
        '160',
        '600',
        '--',
        'City',
        '4.6',
        '1-5',
        '1-4'),
    CarModel(
        '2008 Hyundai i30 CW',
        'https://www.cars-data.com/webp/thumbs/350px/hyundai/hyundai-i30-cw_1006_1.webp',
        '140',
        '400',
        '400',
        'Economy',
        '4.2',
        '1-4',
        '1-2'),
    CarModel(
        '2018 Mercedes-Benz Sprinter',
        'https://www.cars-data.com/webp/thumbs/350px/mercedes-benz/mercedes-benz-sprinter_4522_1.webp',
        '170',
        '700',
        '800',
        'City',
        '4.7',
        '1-7',
        '1-5'),
    CarModel(
        '2014 BMW 2-series Active Tourer',
        'https://www.cars-data.com/webp/thumbs/350px/bmw/bmw-2-serie-active-tourer_3278_1.webp',
        '170',
        '700',
        '--',
        'Sport',
        '4.8',
        '1-5',
        '1-4'),
    CarModel(
        '2015 Cadillac CTS',
        'https://www.cars-data.com/webp/thumbs/350px/cadillac/cadillac-cts_3572_1.webp',
        '160',
        '550',
        '650',
        'Economy',
        '4.4',
        '1-5',
        '1-5'),
  ];
}
