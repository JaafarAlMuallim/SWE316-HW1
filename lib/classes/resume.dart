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
  List<Certification>? _certifications;
  List<Website>? _websites;
  String? _headshotUrl;
  String? _summary;
  String? _objective;

  get candidate => _candidate;

  // set candidate(value) => _candidate = value;

  get experience => _experience;

  // set experience(value) => _experience = value;

  get education => _education;

  // set education(value) => _education = value;

  get skills => _skills;

  // set skills(value) => _skills = value;

  get certifications => _certifications;

  // set certifications(value) => _certifs = value;

  get websites => _websites;

  // set websites(value) => _websites = value;

  get headshotUrl => _headshotUrl;

  // set headshotUrl(value) => _headshotUrl = value;

  get summary => _summary;

//  set summary( value) => _summary = value;

  get objective => _objective;

//  set objective( value) => _objective = value;

  Resume({
    required Candidate candidate,
    required Experience experience,
    required List<Education> education,
    required List<Skill> skill,
    required List<Certification> certifications,
    required List<Website> webs,
    String? headShotUrl,
    String? summary,
    String? objective,
  })  : _candidate = candidate,
        _experience = experience,
        _education = education,
        _skills = skill,
        _certifications = certifications,
        _websites = webs,
        _headshotUrl = headShotUrl,
        _summary = summary,
        _objective = objective;

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
        certifications: certifs,
        webs: websites,
        headShotUrl: data['HeadShot'] ?? 'None Given',
        summary: data['Summary'] ?? 'None Given',
        objective: data['Objective'] ?? 'None Given');
  }
}
