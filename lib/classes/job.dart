import 'package:swe_homework/classes/location.dart';

class Job {
  String? _jobTitle;
  Location? _location;
  DateTime? _start;
  DateTime? _end;
  int? _occupationTime;
  String? _classTitle;

  Job(
      {required String jobTitle,
      required int occupaitonTime,
      required Location location,
      DateTime? start,
      DateTime? end,
      String? classTitle})
      : _jobTitle = jobTitle,
        _location = location,
        _start = start,
        _end = end,
        _occupationTime = occupaitonTime,
        _classTitle = classTitle;

  get jobTitle => _jobTitle;

  set jobTitle(value) => _jobTitle = value;

  get location => _location;

  set location(value) => _location = value;

  get start => _start;

  set start(value) => _start = value;

  get end => _end;

  set end(value) => _end = value;

  get occupationTime => _occupationTime;

  set occupationTime(value) => _occupationTime = value;

  get classTitle => _classTitle;

  set classTitle(value) => _classTitle = value;

  factory Job.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['WorkExperience'];
    return Job(
      jobTitle: data[index]['JobTitle'] ?? 'Not Sepcified',
      occupaitonTime: data[index]['Dates']['MonthsInPosition'] ?? 0,
      location: Location.fromJson(json, where: 'WorkExperience', index: index),
    );
  }
}
