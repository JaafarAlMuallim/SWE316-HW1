import 'package:swe_homework/classes/grade.dart';
import 'package:swe_homework/classes/location.dart';

class Education {
  String? _org;
  String? _eduLevel;
  String? _certificateTitle;
  Grade? _grade;
  Location? _location;

  String? get org => _org;

  // set org(value) => _org = value;

  String? get eduLevel => _eduLevel;

  // set eduLevel(value) => _eduLevel = value;

  String? get certificateTitle => _certificateTitle;

  // set certificateTitle(value) => _certificateTitle = value;

  Grade? get grade => _grade;

  // set grade(value) => _grade = value;

  Location? get location => _location;

  // set location(value) => _location = value;

  Education({
    required String org,
    required String eduLevel,
    required String certificate,
    required Grade grade,
    required Location location,
  }) {
    _org = org;
    _eduLevel = eduLevel;
    _certificateTitle = certificate;
    _grade = grade;
    _location = location;
  }
  factory Education.fromJson(Map<String, dynamic> json, index) {
    Map<String, dynamic> data = json['Value']['Data']['Education'][index];
    return Education(
      org: data['Organization'] ?? 'Not Sepcified',
      eduLevel: data['Accreditation']['EducationLevel'] ?? 'Not Sepcified',
      certificate: data['Accreditation']['Education'] ?? 'Not Sepcified',
      location: Location.fromJson(json, where: 'Education'),
      grade: Grade.fromJson(json, index),
    );
  }
}
