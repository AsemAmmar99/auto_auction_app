import 'package:auto_auction_app/data/models/car_model.dart';
import 'package:auto_auction_app/presentation/widgets/default_material_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/app_cubit/app_cubit.dart';
import '../../data/di/di.dart';
import '../styles/colors.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text.dart';

class BidNowDialog extends StatelessWidget {
  BidNowDialog({Key? key, required this.carModel}) : super(key: key);

  final CarModel carModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bidAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bidAmountController = TextEditingController(
      text: carModel.carMaxBid == '--'
          ? carModel.carStartingPrice
          : carModel.carMaxBid,
    );

    return Dialog(
        child: Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: DefaultFormField(
                radius: 35.sp,
                controller: bidAmountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Bid Amount can't be empty";
                  } else if (carModel.carMaxBid != '--'
                      ? num.tryParse(value)! <
                      num.tryParse(carModel.carMaxBid)!
                      : num.tryParse(value)! <
                      num.tryParse(carModel.carStartingPrice)!) {
                    return "Bid Amount can't be less than the current";
                  }
                  return null;
                },
                prefixIcon: const Icon(
                  Icons.attach_money,
                ),
                hintText: 'Bid Amount',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: DefaultMaterialButton(
                    width: 18.w,
                    height: 5.h,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        sl<AppCubit>().insertToDatabase(
                          bidAmount: bidAmountController.text,
                          carName: carModel.carName,
                          carImage: carModel.carImage,
                        );
                        Fluttertoast.showToast(
                            msg: "Your Bid Amount Added Successfully! It expires after 48 hours",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: darkBlue,
                            fontSize: 14.sp);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    child: DefaultText(
                      text: 'Add',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: DefaultMaterialButton(
                    width: 22.w,
                    height: 5.h,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: DefaultText(
                      text: 'Cancel',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
