import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

class ItemCvTextformField extends StatelessWidget {
  const ItemCvTextformField({
    Key? key,
    this.inputType = TextInputType.text,
    required this.textEditingController,
  }) : super(key: key);
  final TextInputType inputType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: const Offset(2, 4),
            blurRadius: 2,
          )
        ],
      ),
      child: TextFormField(
        keyboardType: inputType,
        controller: textEditingController,
        onSaved: (newValue) {
          textEditingController.text = newValue!;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.r),
              borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1.w,
                  color:  AppColors.myindgo)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1.w,
                  color: Colors.grey.shade600)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 30.w, top: 15.h, bottom: 15.h),
        ),
      ),
    );
  }
}
