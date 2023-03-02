import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/presentation/views/cars_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../data/di/di.dart';

class OfferedForAuctionScreen extends StatelessWidget {
  const OfferedForAuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: ListView.separated(
          itemBuilder: (context, index) =>
              CarsListItem(carModel: sl<AppCubit>().carsList[index]),
          itemCount: sl<AppCubit>().carsList.length,
          separatorBuilder: (BuildContext context, int index) => Row(
            children: [
              Expanded(
                  child: Divider(
                    height: 1.h,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
