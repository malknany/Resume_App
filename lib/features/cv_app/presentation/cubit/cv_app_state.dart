
part of 'cv_app_cubit.dart';

abstract class CvAppState extends Equatable {
  const CvAppState();

  @override
  List<Object> get props => [];
}

class CvAppInitial extends CvAppState {}

class MyAllResumIsEmpty extends CvAppState {}

class MyAllResumIsNotEmpty extends CvAppState {
  final List<Resume>? allResum;
  const MyAllResumIsNotEmpty({
    required this.allResum,
  });
}

