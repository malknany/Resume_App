
import '../../../widget/item_cv_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificatesStep extends StatelessWidget {
  const CertificatesStep({super.key, required this.certificates, required this.period, required this.link, required this.description});

  final TextEditingController certificates;
  final TextEditingController period;
  final TextEditingController link;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Certificates',
        ),
        ItemCvTextformField(textEditingController: certificates),
        SizedBox(
          height: 15.h,
        ),
        const Text(
          'Certificate period',
        ),
        ItemCvTextformField(
            inputType: TextInputType.datetime, textEditingController: period),
        const Text(
          'Link for your own projects',
        ),
        ItemCvTextformField(
            inputType: TextInputType.url, textEditingController: link),
        const Text(
          'Description',
        ),
        ItemCvTextformField(
          inputType: TextInputType.multiline,
          textEditingController: description,
        ),
      ],
    );
  }
}
