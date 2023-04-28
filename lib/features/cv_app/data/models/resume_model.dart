import '../../domain/entities/resume.dart';

class ResumeModel extends Resume {
  ResumeModel(
      {super.id,
      required super.phone,
      required super.image,
      required super.description,
      required super.name,
      required super.jobTitle,
      required super.email,
      required super.address,
      required super.universityName,
      required super.degreeOfCertificates,
      required super.graduationYear,
      required super.certificates,
      required super.certificatePeriod,
      required super.link,
      required super.nativeLanguage,
      required super.technicalSkills,
      required super.nonTechnicalSkills});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'name': name,
      'image': image,
      'description': description,
      'jobTitle': jobTitle,
      'email': email,
      'address': address,
      'universityName': universityName,
      'degreeOfCertificates': degreeOfCertificates,
      'graduationYear': graduationYear,
      'certificates': certificates,
      'certificatePeriod': certificatePeriod,
      'link': link,
      'nativeLanguage': nativeLanguage,
      'technicalSkills': technicalSkills,
      'nonTechnicalSkills': nonTechnicalSkills,
    };
  }

  factory ResumeModel.fromMap(Map<String, dynamic> map) {
    return ResumeModel(
      id: map['id'] != null ? map['id'] as int : null,
      phone: map['phone'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      jobTitle: map['jobTitle'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      universityName: map['universityName'] as String,
      degreeOfCertificates: map['degreeOfCertificates'] as String,
      graduationYear: map['graduationYear'] as String,
      certificates: map['certificates'] as String,
      certificatePeriod: map['certificatePeriod'] as String,
      link: map['link'] as String,
      nativeLanguage: map['nativeLanguage'] as String,
      technicalSkills: map['technicalSkills'] as String,
      nonTechnicalSkills: map['nonTechnicalSkills'] as String,
    );
  }
}
