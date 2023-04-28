import '../entities/resume.dart';
import '../repositories/base_resum_repo.dart';

class GetAllResume {
  final BaseResumRepo baseResumRepo;
  GetAllResume({
    required this.baseResumRepo,
  });
  Future<List<Resume>> call() async {
    return await baseResumRepo.getAllResum();
  }
}
