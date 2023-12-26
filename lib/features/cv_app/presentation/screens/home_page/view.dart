import '../../../../../core/app_colors.dart';

import '../../../data/datasources/database_sqlite.dart';
import '../../../domain/entities/resume.dart';

import '../../cubit/cv_app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_resume/view.dart';

import '../resume/view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  void initState() {
    BlocProvider.of<CvAppCubit>(context).emitGetAllResume();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ResumeStepper(),
            ),
          );
          
        },
        backgroundColor: AppColors.myindgo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       BlocProvider.of<CvAppCubit>(context).emitGetAllResume();
        //     },
        //     icon: const Icon(
        //       Icons.refresh,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.myindgo,
        title: const Text(
          'Youer Cv',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.myindgo,
        color: Colors.white,
        onRefresh: () async {
           BlocProvider.of<CvAppCubit>(context).emitGetAllResume();
        },
        child: SizedBox(
          height: double.infinity,
          child: BlocBuilder<CvAppCubit, CvAppState>(
            builder: (context, state) {
              if (state is MyAllResumIsNotEmpty) {
                List<Resume> resume = (state).allResum!;
                return ListView.builder(
                  itemCount: resume.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          resume[index].name,
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.myindgo),
                        ),
                        subtitle: Text(
                          resume[index].jobTitle,
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.myindgo),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final response = await databaseHelper
                                    .deleteResume(resume[index].id!);
                                if (response > 0) {
                                  resume.removeWhere((element) =>
                                      element.id == resume[index].id);
                                  BlocProvider.of<CvAppCubit>(context)
                                      .emitGetAllResume();
                                } else {
                                  print("something wroing");
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewResumeScreen(
                                        resume: resume[index],
                                      ),
                                    ));
                              },
                              icon: const Icon(
                                Icons.remove_red_eye_rounded,
                                color: AppColors.myindgo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  
                );
              } else {
                // return const SizedBox(
                //   child: Center(
                //     child: Text('Nothing Yet'),
                //   ),
                // );

                return const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.myindgo),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
