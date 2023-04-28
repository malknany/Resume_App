
import '../entities/resume.dart';

abstract class BaseResumRepo {
  Future<List<Resume>> getAllResum();

}
