import 'package:auto_auction_app/constants/screens.dart' as screens;
import 'package:auto_auction_app/data/models/car_model.dart';
import 'package:auto_auction_app/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class CarsListItem extends StatelessWidget {
  final CarModel carModel;

  const CarsListItem({Key? key, required this.carModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          screens.offeredCarDetails,
          arguments: carModel,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Image.network(
                carModel.carImage,
                width: 80.w,
                height: 20.h,
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: DefaultText(
                  text: carModel.carClass,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: DefaultText(
                  text: carModel.carName,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              child: DefaultText(
                text: 'Starts with ${carModel.carStartingPrice}\$',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
