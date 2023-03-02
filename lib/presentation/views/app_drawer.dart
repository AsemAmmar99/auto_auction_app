import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../data/di/di.dart';
import '../styles/colors.dart';
import '../widgets/default_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Drawer(
          width: 45.w,
          child: DrawerHeader(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: DefaultText(
                    text: 'Theme Mode',
                    fontSize: 18.sp,
                  ),
                ),
                Switch(
                  activeColor: barsColor,
                  value: !sl<AppCubit>().isDarkTheme,
                  onChanged: (value) {
                    sl<AppCubit>().changeAppTheme();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
