import 'package:auto_auction_app/business_logic/app_cubit/app_cubit.dart';
import 'package:auto_auction_app/presentation/views/bid_now_dialog.dart';
import 'package:auto_auction_app/presentation/widgets/default_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/car_model.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class OfferedCarDetails extends StatelessWidget {
  final CarModel carModel;

  const OfferedCarDetails({Key? key, required this.carModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 8,
            title: DefaultText(
              text: carModel.carName,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Image.network(
                    carModel.carImage,
                    height: 30.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: carModel.carClass,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14.sp,
                            color: Colors.orange,
                          ),
                          DefaultText(
                            text: carModel.carRating,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w)
                      .copyWith(bottom: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: DefaultText(
                          text:
                              'Starting Price: ${carModel.carStartingPrice}\$',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: DefaultText(
                          text: 'Max Bid: ${carModel.carMaxBid}\$',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.sp, horizontal: 6.sp),
                          decoration: BoxDecoration(
                            color: grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.speed_outlined,
                                  size: 20.sp,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: '${carModel.carPower} KM',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: 'Power',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.sp, horizontal: 6.sp),
                          decoration: BoxDecoration(
                            color: grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.people_outline,
                                  size: 20.sp,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: 'People',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: '(${carModel.peopleNum})',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.sp, horizontal: 6.sp),
                          decoration: BoxDecoration(
                            color: grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 20.sp,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: 'Bags',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: DefaultText(
                                  text: '(${carModel.bagsNum})',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultMaterialButton(
                  onPressed: (){
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => BidNowDialog(carModel: carModel),
                    );
                  },
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5.w,),
                  margin: EdgeInsets.symmetric(vertical: 2.h,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DefaultText(
                          text: 'Bid Now!',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
