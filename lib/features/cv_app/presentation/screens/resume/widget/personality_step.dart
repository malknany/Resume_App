import '../../../../../../core/utality.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/item_cv_textform.dart';
import 'package:flutter/material.dart';

class PersonalityStep extends StatefulWidget {
  const PersonalityStep(
      {super.key,
      required this.name,
      required this.jobTitle,
      required this.email,
      required this.address,
      required this.phone});

  final TextEditingController name;
  final TextEditingController jobTitle;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController phone;

  static String? imagePath;

  @override
  State<PersonalityStep> createState() => _PersonalityStepState();
}

class _PersonalityStepState extends State<PersonalityStep> {
  String msg = 'Add Your photo';

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != Null) {
      final bytes = await pickedFile!.readAsBytes();
      PersonalityStep.imagePath = Utility.base64String(bytes);
      setState(() {});
      msg = 'Selected Image';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: pickImage,
          child: Text(msg),
        ),
        const Text(
          'Name',
        ),
        ItemCvTextformField(
            inputType: TextInputType.text, textEditingController: widget.name),
        const Text(
          'Job Title',
        ),
        ItemCvTextformField(textEditingController: widget.jobTitle),
        const Text(
          'E-mail',
        ),
        ItemCvTextformField(
            inputType: TextInputType.emailAddress,
            textEditingController: widget.email),
        const Text(
          'Address',
        ),
        ItemCvTextformField(
            inputType: TextInputType.streetAddress,
            textEditingController: widget.address),
        const Text(
          'Phone',
        ),
        ItemCvTextformField(
            inputType: TextInputType.phone,
            textEditingController: widget.phone),
      ],
    );
  }
}
