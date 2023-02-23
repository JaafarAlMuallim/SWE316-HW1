import 'package:swe_homework/classes/dates.dart';
import 'package:swe_homework/classes/location.dart';

class Job {
  String? _jobTitle;
  Location? _location;
  Date? _date;

  String? _classTitle;

  Job(
      {required String jobTitle,
      required Location location,
      required Date date,
      String? classTitle})
      : _jobTitle = jobTitle,
        _location = location,
        _date = date,
        _classTitle = classTitle;

  get jobTitle => _jobTitle;

  set jobTitle(value) => _jobTitle = value;

  get location => _location;

  set location(value) => _location = value;

  get date => _date;

  set date(value) => _date = value;

  get classTitle => _classTitle;

  set classTitle(value) => _classTitle = value;

  factory Job.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['WorkExperience'];
    return Job(
      jobTitle: data[index]['JobTitle'] ?? 'Not Sepcified',
      date: Date.fromJson(json, index),
      location: Location.fromJson(json, where: 'WorkExperience', index: index),
    );
  }
}
