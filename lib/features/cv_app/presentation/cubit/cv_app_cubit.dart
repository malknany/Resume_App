
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/resum_repo.dart';
import '../../domain/entities/resume.dart';

part 'cv_app_state.dart';

class CvAppCubit extends Cubit<CvAppState> {
  CvAppCubit(
    this.resumeRepo,
  ) : super(CvAppInitial());
  //GetAllResume getAllResume;
  ResumeRepo resumeRepo;
  void emitGetAllResume() {
    emit(CvAppInitial());
    resumeRepo.getAllResum().then((allResum) {
      emit(MyAllResumIsNotEmpty(allResum: allResum));
    });
  }
}
