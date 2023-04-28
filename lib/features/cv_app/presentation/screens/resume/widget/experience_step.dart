
import '../../../widget/item_chip.dart';
import 'package:flutter/material.dart';

class ExperienceStep extends StatelessWidget {
  const ExperienceStep({super.key, required this.tSkills, required this.nTSkills, required this.listOfTSkills, required this.listOfNTSkills});

  final TextEditingController tSkills;
  final TextEditingController nTSkills;
  final List<String> listOfTSkills;
  final List<String> listOfNTSkills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Your Technical Skills',
        ),
        ItemChip(textEditingController: tSkills, values: listOfTSkills),
        const Text(
          'your Non Technical Skills',
        ),
        ItemChip(textEditingController: nTSkills, values: listOfNTSkills),
      ],
    );
  }
}
