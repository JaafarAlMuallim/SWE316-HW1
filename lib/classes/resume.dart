import 'package:swe_homework/classes/candidate.dart';
import 'package:swe_homework/classes/education.dart';
import 'package:swe_homework/classes/experience.dart';
import 'package:swe_homework/classes/skill.dart';

class Resume {
  Candidate? _candidate;
  Experience? _exp;
  List<Education>? _edu;
  List<Skill>? _skills;
  List<String>? _certifs;

  get candidate => _candidate;

  set candidate(value) => _candidate = value;

  get exp => _exp;

  set exp(value) => _exp = value;

  get edu => _edu;

  set edu(value) => _edu = value;

  get skills => _skills;

  set skills(value) => _skills = value;

  get certifs => _certifs;

  set certifs(value) => _certifs = value;

  Resume(
      {required Candidate candidate,
      required Experience exp,
      required List<Education> edu,
      required List<Skill> skill,
      required List<String> certifs})
      : _candidate = candidate,
        _exp = exp,
        _edu = edu,
        _skills = skill,
        _certifs = certifs;

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
    List<String> certifs = [];
    if (certifcations.isNotEmpty) {
      for (int i = 0; i < certifcations.length; i++) {
        certifs.add(certifcations[0]);
      }
    }
    List<dynamic> edus = data['Education'];
    List<Education> edu = [];
    if (edus.isNotEmpty) {
      for (int i = 0; i < edus.length; i++) {
        edu.add(Education.fromJson(json, i));
      }
    }
    return Resume(
        candidate: candidate,
        exp: exp,
        edu: edu,
        skill: skillList,
        certifs: certifs);
  }
}
