import 'package:swe_homework/classes/grade.dart';
import 'package:swe_homework/classes/location.dart';

class Education {
  String? _org;
  String? _eduLevel;
  // String? _certificate;
  Grade? _grade;
  Location? _location;

  get org => _org;

  set org(value) => _org = value;

  get eduLevel => _eduLevel;

  set eduLevel(value) => _eduLevel = value;

  // get certificate => _certificate;

  // set certificate(value) => _certificate = value;

  get grade => _grade;

  set grade(value) => _grade = value;

  get location => _location;

  set location(value) => _location = value;

  Education({
    required String org,
    required String eduLevel,
    // required String certificate,
    required Grade grade,
    required Location location,
  }) {
    _org = org;
    _eduLevel = eduLevel;
    // _certificate = certificate;
    _grade = grade;
    _location = location;
  }
  factory Education.fromJson(dynamic json, index) {
    dynamic data = json['Value']['Data']['Education'][index];
    return Education(
      org: data['Organization'] ?? 'Not Sepcified',
      eduLevel: data['Accreditation']['EducationLevel'] ?? 'Not Sepcified',
      // certificate: data['Accreditation']['Education'] ?? 'Not Sepcified',
      location: Location.fromJson(json, where: 'Education'),
      grade: Grade.fromJson(json, index),
    );
  }
}
