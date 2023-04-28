import '../../../../../core/app_colors.dart';
import '../../../data/datasources/database_sqlite.dart';
import '../../../data/models/resume_model.dart';

import '../view_resume/view.dart';

import 'widget/personality_step.dart';
import 'controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeStepper extends StatefulWidget {
  const ResumeStepper({Key? key}) : super(key: key);

  @override
  State<ResumeStepper> createState() => _ResumeStepperState();
}

class _ResumeStepperState extends State<ResumeStepper> {
  final _resumeStepperControl = ResumeStepperControl();
  DatabaseHelper databaseHelper = DatabaseHelper();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Your Resume ',
          style: TextStyle(fontSize: 20.sp, color: AppColors.myindgo),
        ),
        centerTitle: true,
        foregroundColor: AppColors.myindgo,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.myindgo),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Stepper(
            elevation: 0,
            steps: _resumeStepperControl.getSteps(),
            currentStep: _resumeStepperControl.currentStep,
            type: StepperType.vertical,
            onStepCancel: () => _resumeStepperControl.currentStep == 0
                ? null
                : setState(() {
                    _resumeStepperControl.currentStep -= 1;
                  }),
            onStepContinue: () async {
              bool isLastStep = (_resumeStepperControl.currentStep ==
                  _resumeStepperControl.getSteps().length - 1);
              if (isLastStep) {
                final response = await databaseHelper.insertResume(
                  ResumeModel(
                  description: _resumeStepperControl.description.text,
                  phone: _resumeStepperControl.phone.text,
                  image: PersonalityStep.imagePath!,
                  name: _resumeStepperControl.name.text,
                  jobTitle: _resumeStepperControl.jobTitle.text,
                  email: _resumeStepperControl.email.text,
                  address: _resumeStepperControl.address.text,
                  universityName: _resumeStepperControl.universityName.text,
                  degreeOfCertificates: _resumeStepperControl.degree.text,
                  graduationYear: _resumeStepperControl.years.text,
                  certificates: _resumeStepperControl.certificates.text,
                  certificatePeriod: _resumeStepperControl.period.text,
                  link: _resumeStepperControl.link.text,
                  nativeLanguage:
                      _resumeStepperControl.listOfLanguage.join(','),
                  technicalSkills:
                      _resumeStepperControl.listOfTSkills.join(','),
                  nonTechnicalSkills:
                      _resumeStepperControl.listOfNTSkills.join(','),
                ));
                if (response > 0) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ViewResumeScreen(
                        resume: ResumeModel(
                          description: _resumeStepperControl.description.text,
                          phone: _resumeStepperControl.phone.text,
                          image: PersonalityStep.imagePath!,
                          name: _resumeStepperControl.name.text,
                          jobTitle: _resumeStepperControl.jobTitle.text,
                          email: _resumeStepperControl.email.text,
                          address: _resumeStepperControl.address.text,
                          universityName:
                              _resumeStepperControl.universityName.text,
                          degreeOfCertificates:
                              _resumeStepperControl.degree.text,
                          graduationYear: _resumeStepperControl.years.text,
                          certificates: _resumeStepperControl.certificates.text,
                          certificatePeriod: _resumeStepperControl.period.text,
                          link: _resumeStepperControl.link.text,
                          nativeLanguage:
                              _resumeStepperControl.listOfLanguage.join(','),
                          technicalSkills:
                              _resumeStepperControl.listOfTSkills.join(','),
                          nonTechnicalSkills:
                              _resumeStepperControl.listOfNTSkills.join(','),
                        ),
                      ),
                    ),
                  );
                } else {
                  print("Error=======================");
                }
              } else {
                setState(() {
                  _resumeStepperControl.currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              _resumeStepperControl.currentStep = step;
            }),
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(
                      _resumeStepperControl.currentStep == 4
                          ? 'Finish'
                          : 'Next',
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )),
                  if (_resumeStepperControl.currentStep != 0)
                    SizedBox(
                      width: 15.w,
                    ),
                  if (_resumeStepperControl.currentStep != 0)
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: details.onStepCancel,
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.myindgo),
                      ),
                    )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
