import 'package:flutter/material.dart';


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
      margin: const EdgeInsets.symmetric(vertical: 6 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: const Offset(2, 4),
            blurRadius: 2,
          )
        ],
      ),
      child: TextFormField(
        onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
        keyboardType: inputType,
        controller: textEditingController,
        onSaved: (newValue) {
          textEditingController.text = newValue!;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2 ),
              borderSide: const BorderSide(
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1 ,
                  color:  AppColors.myindgo)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10 ),
              borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1 ,
                  color: Colors.grey.shade600)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 30 , top: 15 , bottom: 15 ),
        ),
      ),
    );
  }
}
