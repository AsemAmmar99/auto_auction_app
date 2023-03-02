import 'package:auto_auction_app/presentation/styles/colors.dart';
import 'package:auto_auction_app/presentation/views/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';
import '../../../data/di/di.dart';
import '../../widgets/default_text.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          drawer: const AppDrawer(),
          appBar: AppBar(
            centerTitle: true,
            elevation: 8,
            title: DefaultText(
              text: sl<AppCubit>().appBarTitles[sl<AppCubit>().currentIndex],
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return sl<AppCubit>().screens[sl<AppCubit>().currentIndex];
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: sl<AppCubit>().currentIndex,
            onTap: (index) => sl<AppCubit>().changeIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.car_rental,
                ),
                label: 'Offered',
                backgroundColor: lightSkyBlue,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                ),
                label: 'My Bids',
                backgroundColor: lightSkyBlue,
              ),
            ],
          ),
        );
      },
    );
  }
}
