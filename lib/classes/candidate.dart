import 'package:swe_homework/classes/email.dart';
import 'package:swe_homework/classes/language.dart';
import 'package:swe_homework/classes/location.dart';
import 'package:swe_homework/classes/name.dart';
import 'package:swe_homework/classes/phone_number.dart';

class Candidate {
  Name? _name;
  List<PhoneNumber>? _phoneNums;
  List<Email>? _emails;
  String? _bdate;
  List<Language>? _langs;
  Location? _location;
  String? _linkedinAcc;

  Name? get name => _name;

  // set name(value) => _name = value;

  List<PhoneNumber>? get phoneNums => _phoneNums;

  // set phoneNums(value) => _phoneNums = value;

  List<Email>? get emails => _emails;

  // set emails(value) => _emails = value;

  String? get bdate => _bdate;

  // set bdate(value) => _bdate = value;
  String? get linkedinAcc => _linkedinAcc;

  // set linkedinAcc(value) => _linkedinAcc = value;

  List<Language>? get langs => _langs;

  // set langs(value) => _langs = value;

  Location? get location => _location;

  // set location(value) => _location = value;

  Candidate(
      {required Name name,
      required String bdate,
      required List<Email> emails,
      required List<PhoneNumber> phoneNums,
      required List<Language>? langs,
      required Location? location,
      required String? linkedin})
      : _name = name,
        _bdate = bdate,
        _emails = emails,
        _phoneNums = phoneNums,
        _langs = langs,
        _location = location,
        _linkedinAcc = linkedin;
  factory Candidate.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['Value']['Data'];
    List<Email> emails = [];
    List<PhoneNumber> phoneNums = [];
    if (data['Emails'].length > 0) {
      for (int i = 0; i < data['Emails'].length; i++) {
        emails.add(Email.fromJson(json, i));
      }
    } else {
      emails.add(Email(email: 'No email given'));
    }
    List<dynamic> phones = data['PhoneNumbers'];
    if (phones.isNotEmpty) {
      for (int i = 0; i < phones.length; i++) {
        phoneNums.add(PhoneNumber.fromJson(json, i));
      }
    } else {
      phoneNums.add(PhoneNumber(phoneNum: 'No phone number given'));
    }
    List<dynamic> languages = data['Languages'];
    List<Language> langs = [];
    if (languages.isNotEmpty) {
      for (int i = 0; i < languages.length; i++) {
        langs.add(Language.fromJson(json, i));
      }
    } else {
      langs.add(Language(language: 'None Given', code: 'None Given'));
    }

    return Candidate(
        name: Name.fromJson(json),
        bdate: data['DateOfBirth'] ?? 'Not Sepcified',
        emails: emails,
        phoneNums: phoneNums,
        langs: langs,
        location: Location.fromJson(json),
        linkedin: data['Linkedin'] ?? 'None Given');
  }
}
