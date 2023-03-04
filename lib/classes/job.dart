import 'package:swe_homework/classes/date.dart';
import 'package:swe_homework/classes/job_classification.dart';
import 'package:swe_homework/classes/location.dart';

class Job {
  String? _jobTitle;
  String? _description;
  String? _org;
  Location? _location;
  Date? _date;
  JobClassification? _classification;

  Job(
      {required String jobTitle,
      required String description,
      required String org,
      required Location location,
      required Date date,
      required JobClassification classification})
      : _jobTitle = jobTitle,
        _location = location,
        _date = date,
        _description = description,
        _org = org,
        _classification = classification;

  String? get jobTitle => _jobTitle;

  // set jobTitle(value) => _jobTitle = value;

  Location? get location => _location;

  // set location(value) => _location = value;

  Date? get date => _date;

  // set date(value) => _date = value;

  String? get description => _description;

//  set description( value) => _description = value;

  String? get org => _org;

//  set org( value) => _org = value;

  JobClassification? get classification => _classification;

//  set classification( value) => _classification = value;

  factory Job.fromJson(Map<String, dynamic> json, int index) {
    List<dynamic> data = json['Value']['Data']['WorkExperience'];
    JobClassification classification = JobClassification.fromJson(json, index);
    return Job(
      jobTitle: data[index]['JobTitle'] ?? 'Not Sepcified',
      date: Date.fromJson(json, index),
      location: Location.fromJson(json, where: 'WorkExperience', index: index),
      classification: classification,
      description: data[index]['JobDescription'],
      org: data[index]['Organization'],
    );
  }
}
