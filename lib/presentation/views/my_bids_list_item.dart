import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/presentation/views/edit_bid_dialog.dart';
import 'package:auto_auction_app/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../data/di/di.dart';
import '../styles/colors.dart';

class MyBidsListItem extends StatelessWidget {

  final Map carModel;

  const MyBidsListItem({Key? key, required this.carModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool expired = carModel['endDate'] == DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day).toString() ? true : false;

    return Dismissible(
      key: Key(carModel['id'].toString()),
      onDismissed: (direction) async{
        await sl<AppCubit>().deleteBid(id: carModel['id']);
        Fluttertoast.showToast(
            msg: "Your Bid Deleted Successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: darkBlue,
            fontSize: 14.sp
        );
      },
      child: InkWell(
        onTap: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => EditBidDialog(model: carModel),
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
                  carModel['carImage'],
                  width: 80.w,
                  height: 20.h,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
                  child: DefaultText(
                    text: carModel['carName'],
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Flexible(
                child: DefaultText(
                  text: 'Your Bid amount is ${carModel['bidAmount']}\$, tap to edit',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: DefaultText(
                    text: expired ? 'Expired, Swipe to delete' : 'Active',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
