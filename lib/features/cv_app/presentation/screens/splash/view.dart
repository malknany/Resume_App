import 'dart:async';
import '../../../../../core/app_colors.dart';

import '../../../data/datasources/database_sqlite.dart';
import '../../../data/repositories/resum_repo.dart';

import '../../cubit/cv_app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_page/view.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CvAppCubit(ResumeRepo(databaseHelper: DatabaseHelper())),
            child: const HomePage(),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'CV App',
          style: TextStyle(
            fontSize: 30,
            color: AppColors.myindgo,
          ),
        ),
      ),
    );
  }
}
