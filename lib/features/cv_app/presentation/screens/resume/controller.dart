import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'widget/certificates_step.dart';
import 'widget/education_step.dart';
import 'widget/experience_step.dart';
import 'widget/language.step.dart';
import 'widget/personality_step.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;

class ResumeStepperControl {
  final name = TextEditingController();
  final jobTitle = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final universityName = TextEditingController();
  final period = TextEditingController();
  final link = TextEditingController();
  final description = TextEditingController();
  final language = TextEditingController();
  final tSkills = TextEditingController();
  final nTSkills = TextEditingController();
  final certificates = TextEditingController();
  final degree = TextEditingController();
  final years = TextEditingController();
  int currentStep = 0;
  List<String> listOfTSkills = [];
  List<String> listOfNTSkills = [];
  List<String> listOfLanguage = [];

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(
          'Personality',
        ),
        content: PersonalityStep(
          name: name,
          jobTitle: jobTitle,
          email: email,
          address: address,
          phone: phone,
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(
          'Education',
        ),
        content: EducationStep(
            universityName: universityName, degree: degree, years: years),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text(
          'Language',
        ),
        content:
            LanguageStep(listOfLanguage: listOfLanguage, language: language),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text(
          'Experience',
        ),
        content: ExperienceStep(
            tSkills: tSkills,
            nTSkills: nTSkills,
            listOfTSkills: listOfTSkills,
            listOfNTSkills: listOfNTSkills),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(
          'Certificates',
        ),
        content: CertificatesStep(
            certificates: certificates,
            period: period,
            link: link,
            description: description),
      )
    ];
  }

  Future screenToPdf(
    String fileName,
    screenShot,
  ) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    String path = (await getTemporaryDirectory()).path;
    File pdfFile = await File('$path/$fileName.pdf').create();

    pdfFile.writeAsBytesSync(await pdf.save());
    await Share.shareFiles([pdfFile.path]);
  }
}
