import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/app_cubit/app_cubit.dart';
import '../../data/di/di.dart';
import '../styles/colors.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_material_button.dart';
import '../widgets/default_text.dart';
import '../widgets/default_text_button.dart';

class EditBidDialog extends StatelessWidget {
  EditBidDialog({Key? key, required this.model}) : super(key: key);

  final Map model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bidAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bidAmountController = TextEditingController(text: '${model['bidAmount']}');

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
                  } else if (num.tryParse(value)! <
                      num.tryParse(model['bidAmount'])!) {
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
                        sl<AppCubit>().editBidAmount(
                          bidAmount: bidAmountController.text,
                          id: model['id'],
                        );
                        Fluttertoast.showToast(
                            msg: "Your Bid Amount Edited Successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: darkBlue,
                            fontSize: 14.sp);
                        Navigator.pop(context);
                      }
                    },
                    child: DefaultText(
                      text: 'Edit',
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
