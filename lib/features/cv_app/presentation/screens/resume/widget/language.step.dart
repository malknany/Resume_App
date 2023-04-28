
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/item_chip.dart';

class LanguageStep extends StatelessWidget {
  const LanguageStep({super.key, required this.listOfLanguage, required this.language});
  final List<String> listOfLanguage;
  final TextEditingController language;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Native language',
        ),
        ItemChip(
          textEditingController: language,
          values: listOfLanguage,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
