import '../../../../../core/app_colors.dart';

import '../../../../../core/utality.dart';

import '../../../domain/entities/resume.dart';

import '../resume/controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

class ViewResumeScreen extends StatelessWidget {
  ViewResumeScreen({
    required this.resume,
    Key? key,
  }) : super(key: key);

  final Resume resume;
  final screenshotControl = ScreenshotController();
  final ResumeStepperControl control = ResumeStepperControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.myindgo,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: AppColors.myindgo,
        centerTitle: true,
        title: Text(
          'Your Cv',
          style: TextStyle(
            fontSize: 25.sp,
            color: AppColors.myindgo,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                control.screenToPdf('MyCV', await screenshotControl.capture());
              },
              icon: const Icon(
                Icons.share,
                color: AppColors.myindgo,
              )),
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomePage(),
          //         ),
          //         (route) => false,
          //       );
          //       BlocProvider.of<CvAppCubit>(context).emitGetAllResume();
          //     },
          //     icon: const Icon(
          //       Icons.home,
          //       color: AppColors.myindgo,
          //     ))
        ],
      ),
      body: Screenshot(
        controller: screenshotControl,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 85.h,
                color: const Color(0xff8D4B55),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          50.r,
                        ),
                      ),
                      child: Utility.imageFromBase64String(resume.image),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            resume.name,
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            resume.jobTitle,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'personality',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                resume.email,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.phone_android,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                resume.phone,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                resume.address,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 80.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              resume.nativeLanguage.split(',').length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                                child: Text(
                                  '- ${resume.nativeLanguage.split(',')[index]}',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Experience',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 90.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Text(
                            '- Experience : \n ${resume.description} ',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'certificates',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Text(
                            '- ${resume.certificates}  ',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '- ${resume.certificatePeriod}',
                            //softWrap: true,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          Text(
                            '- ${resume.link} ',
                            //softWrap: true,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Education',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Text(
                            '- ${resume.universityName} ',
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          Text(
                            '- Degree:${resume.degreeOfCertificates} ',
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          Text(
                            '- GraduationYear:${resume.graduationYear} ',
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Skills',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: const Color(0xff8D4B55)),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: const Divider(
                              color: Color(0xff8D4B55),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              resume.nonTechnicalSkills.split(',').length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                                child: Text(
                                  '- ${resume.nonTechnicalSkills.split(',')[index]}',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              resume.technicalSkills.split(',').length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                                child: Text(
                                  '- ${resume.technicalSkills.split(',')[index]}',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
