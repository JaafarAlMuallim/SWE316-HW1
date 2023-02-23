import 'package:swe_homework/classes/job.dart';

class Experience {
  int? _expYears;
  String? _profession;
  List<Job>? _jobs;

  Experience(
      {required int expYears,
      required String profession,
      required List<Job> jobs})
      : _expYears = expYears,
        _profession = profession,
        _jobs = jobs;

  get expYears => _expYears;

  set expYears(value) => _expYears = value;

  get profession => _profession;

  set profession(value) => _profession = value;

  get jobs => _jobs;

  set jobs(value) => _jobs = value;

  factory Experience.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
    List<Job> jobsList = [];

    dynamic jobsData = json['Value']['Data']['WorkExperience'] as List;
    if (jobsData.length > 0) {
      for (int i = 0; i < jobsData.length; i++) {
        jobsList.add(Job.fromJson(json, i));
      }
    }
    return Experience(
        expYears: data['TotalYearsExperience'] ?? 'Not Sepcified',
        profession: data['Profession'] ?? 'Not Sepcified',
        jobs: jobsList);
  }
}
