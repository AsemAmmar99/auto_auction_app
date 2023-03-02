import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/presentation/views/my_bids_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../data/di/di.dart';
import '../../widgets/default_text.dart';

class MyBidsScreen extends StatelessWidget {
  const MyBidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Visibility(
          visible: sl<AppCubit>().myBidsList.isNotEmpty,
          replacement: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.money_off,
                  size: 75.sp,
                ),
                DefaultText(
                  text: 'There is no bids yet..',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    MyBidsListItem(carModel: sl<AppCubit>().myBidsList[index]),
                itemCount: sl<AppCubit>().myBidsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                              height: 1.h,
                            ))
                      ],
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
