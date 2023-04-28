
import '../datasources/database_sqlite.dart';
import '../models/resume_model.dart';
import '../../domain/repositories/base_resum_repo.dart';

class ResumeRepo extends BaseResumRepo {
  DatabaseHelper databaseHelper;
  ResumeRepo({
    required this.databaseHelper,
  });

  @override
  Future<List<ResumeModel>> getAllResum() async {
    final response = await databaseHelper.getResumes();
    return response;
  }

}
