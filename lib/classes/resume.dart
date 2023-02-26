import 'package:swe_homework/classes/candidate.dart';
import 'package:swe_homework/classes/certifications.dart';
import 'package:swe_homework/classes/education.dart';
import 'package:swe_homework/classes/experience.dart';
import 'package:swe_homework/classes/skill.dart';
import 'package:swe_homework/classes/website.dart';

class Resume {
  Candidate? _candidate;
  Experience? _experience;
  List<Education>? _education;
  List<Skill>? _skills;
  List<Certification>? _certifs;
  List<Website>? _websites;

  get candidate => _candidate;

  set candidate(value) => _candidate = value;

  get experience => _experience;

  set experience(value) => _experience = value;

  get education => _education;

  set education(value) => _education = value;

  get skills => _skills;

  set skills(value) => _skills = value;

  get certifs => _certifs;

  set certifs(value) => _certifs = value;

  get websites => _websites;

  set websites(value) => _websites = value;

  Resume(
      {required Candidate candidate,
      required Experience experience,
      required List<Education> education,
      required List<Skill> skill,
      required List<Certification> certifs,
      required List<Website> webs})
      : _candidate = candidate,
        _experience = experience,
        _education = education,
        _skills = skill,
        _certifs = certifs,
        _websites = webs;

  factory Resume.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
    Candidate candidate = Candidate.fromJson(json);
    Experience exp = Experience.fromJson(json);
    List<dynamic> skillsData = json['Value']['Data']['Skills'];
    List<Skill> skillList = [];
    if (skillsData.isNotEmpty) {
      for (int i = 0; i < skillsData.length; i++) {
        Skill skill = Skill.fromJson(json, i);
        skillList.add(skill);
      }
    }
    List<dynamic> certifcations = data['Certifications'];
    List<Certification> certifs = [];
    if (certifcations.isNotEmpty) {
      for (int i = 0; i < certifcations.length; i++) {
        certifs.add(Certification.fromJson(json, i));
      }
    }
    List<dynamic> edus = data['Education'];
    List<Education> edu = [];
    if (edus.isNotEmpty) {
      for (int i = 0; i < edus.length; i++) {
        edu.add(Education.fromJson(json, i));
      }
    }
    List<dynamic> webs = data['Websites'];
    List<Website> websites = [];
    if (webs.isNotEmpty) {
      for (int i = 0; i < webs.length; i++) {
        websites.add(Website.fromJson(json, i));
      }
    }
    return Resume(
        candidate: candidate,
        experience: exp,
        education: edu,
        skill: skillList,
        certifs: certifs,
        webs: websites);
  }
}
