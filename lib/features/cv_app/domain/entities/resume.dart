import 'package:equatable/equatable.dart';

class Resume extends Equatable {
  int? id;
  String phone;
  String name;
  String image;
  String jobTitle;
  String email;
  String address;
  String universityName;
  String degreeOfCertificates;
  String graduationYear;
  String certificates;
  String certificatePeriod;
  String link;
  String description;
  String nativeLanguage;
  String technicalSkills;
  String nonTechnicalSkills;
  Resume({
     this.id,
    required this.phone,
    required this.image,
    required this.description,
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.address,
    required this.universityName,
    required this.degreeOfCertificates,
    required this.graduationYear,
    required this.certificates,
    required this.certificatePeriod,
    required this.link,
    required this.nativeLanguage,
    required this.technicalSkills,
    required this.nonTechnicalSkills,
  });

  @override
  List<Object> get props {
    return [
      id!,
      phone,
      name,
      image,
      jobTitle,
      email,
      address,
      universityName,
      degreeOfCertificates,
      graduationYear,
      certificates,
      certificatePeriod,
      link,
      description,
      nativeLanguage,
      technicalSkills,
      nonTechnicalSkills,
    ];
  }
}
