import 'package:swe_homework/classes/email.dart';
import 'package:swe_homework/classes/phone_number.dart';

class Candidate {
  String? _name;
  List<PhoneNumber>? _phoneNums;
  List<Email>? _emails;
  String? _bdate;
  List<String>? _langs;

  get name => _name;

  set name(value) => _name = value;

  get phoneNums => _phoneNums;

  set phoneNums(value) => _phoneNums = value;

  get emails => _emails;

  set emails(value) => _emails = value;

  get bdate => _bdate;

  set bdate(value) => _bdate = value;

  get langs => _langs;

  set langs(value) => _langs = value;

  Candidate({
    required String name,
    required String bdate,
    required List<Email> emails,
    required List<PhoneNumber> phoneNums,
    List<String>? langs,
  })  : _name = name,
        _bdate = bdate,
        _emails = emails,
        _phoneNums = phoneNums,
        _langs = langs;
  factory Candidate.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
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
    return Candidate(
      name: data['Name']['Raw'] ?? 'Not Sepcified',
      bdate: data['DateOfBirth'] ?? 'Not Sepcified',
      emails: emails,
      phoneNums: phoneNums,
    );
  }
}
