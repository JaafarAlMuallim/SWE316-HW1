import 'package:swe_homework/classes/skill.dart';
import 'package:swe_homework/classes/job.dart';

class Experience {
  int? _expYears;
  String? _profession;
  List<String>? _certifs;
  List<Skill>? _skills;
  List<Job>? _jobs;

  Experience(
      {required int expYears,
      required String profession,
      required List<String> certifs,
      required List<Skill> skills,
      required List<Job> jobs})
      : _expYears = expYears,
        _profession = profession,
        _certifs = certifs,
        _skills = skills,
        _jobs = jobs;

  get expYears => _expYears;

  set expYears(value) => _expYears = value;

  get profession => _profession;

  set profession(value) => _profession = value;

  get certifs => _certifs;

  set certifs(value) => _certifs = value;

  get skills => _skills;

  set skills(value) => _skills = value;

  get jobs => _jobs;

  set jobs(value) => _jobs = value;

  factory Experience.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
    List<dynamic> certifcations = data['Certifications'];
    dynamic skillsData = json['Value']['Data']['Skills'] as List;
    List<Skill> skillList = [];
    for (int i = 0; i < skillsData.length; i++) {
      Skill skill = Skill.fromJson(json, i);
      skillList.add(skill);
    }
    List<String> certifs = [];
    for (int i = 0; i < certifs.length; i++) {
      certifs.add(certifcations[i]);
    }
    List<Job> jobsList = [];
    dynamic jobsData = json['Value']['Data']['WorkExperience'] as List;
    for (int i = 0; i < jobsData.length; i++) {
      jobsList.add(Job.fromJson(json, i));
    }

    return Experience(
        expYears: data['TotalYearsExperience'],
        profession: data['Profession'],
        certifs: certifs,
        skills: skillList,
        jobs: jobsList);
  }
}
