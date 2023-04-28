
import '../../../widget/item_cv_textform.dart';
import '../../../widget/item_drop_dowen.dart';
import 'package:flutter/material.dart';

class EducationStep extends StatelessWidget {
  const EducationStep({super.key, required this.universityName, required this.degree, required this.years});

  final TextEditingController universityName;
  final TextEditingController degree;
  final TextEditingController years;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'University Name',
        ),
        ItemCvTextformField(textEditingController: universityName),
        const Text(
          'Degree of Certificates',
        ),
        ItemDropDowen(
            controller: degree,
            items: const [
              'Excellent',
              'Very Good',
              'Good',
              'Accept',
            ],
            selectedItem: 'Good'),
        const Text(
          'Graduation year',
        ),
        ItemDropDowen(
            controller: years,
            items:
                List.generate(30, (index) => DateTime.now().year - 15 + index),
            selectedItem: '2020')
      ],
    );
  }
}
