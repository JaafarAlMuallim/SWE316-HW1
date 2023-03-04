import 'package:swe_homework/classes/date.dart';
import 'package:swe_homework/classes/job.dart';
import 'package:swe_homework/classes/job_classification.dart';
import 'package:swe_homework/classes/location.dart';

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

  int? get expYears => _expYears;

  // set expYears(value) => _expYears = value;

  String? get profession => _profession;

  // set profession(value) => _profession = value;

  List<Job>? get jobs => _jobs;

  // set jobs(value) => _jobs = value;

  factory Experience.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['Value']['Data'];
    List<Job> jobsList = [];

    List<dynamic> jobsData = json['Value']['Data']['WorkExperience'];
    if (jobsData.isNotEmpty) {
      for (int i = 0; i < jobsData.length; i++) {
        jobsList.add(Job.fromJson(json, i));
      }
    } else {
      jobsList.add(Job(
          jobTitle: 'X',
          description: 'None',
          org: 'X',
          location: Location(
              country: 'X', code: 'X', city: 'X', state: 'X', formatted: 'X'),
          date: Date(start: 'X', finsih: 'X', occupation: 0, isCurrent: false),
          classification: JobClassification(
              title: 'X',
              managementLevel: 0,
              subMajor: 'X',
              minor: 'X',
              major: 'X',
              socCode: 0)));
    }
    return Experience(
        expYears: data['TotalYearsExperience'] ?? 'Not Sepcified',
        profession: data['Profession'] ?? 'Not Sepcified',
        jobs: jobsList);
  }
}
