import 'package:swe_homework/classes/email.dart';
import 'package:swe_homework/classes/phone_number.dart';

class Candidate {
  String? _fName;
  String? _lName;
  List<PhoneNumber>? _phoneNums;
  List<Email>? _emails;
  String? _bdate;
  List<String>? _langs;

  get fName => _fName;

  set fName(value) => _fName = value;

  get lName => _lName;

  set lName(value) => _lName = value;

  get phoneNum => _phoneNums;

  set phoneNum(value) => _phoneNums = value;

  get email => _emails;

  set email(value) => _emails = value;

  get bdate => _bdate;

  set bdate(value) => _bdate = value;

  get langs => _langs;

  set langs(value) => _langs = value;

  Candidate({
    required String fName,
    required String lName,
    required String bdate,
    required List<Email> emails,
    required List<PhoneNumber> phoneNums,
    List<String>? langs,
  })  : _fName = fName,
        _lName = lName,
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
    }
    List<dynamic> phones = data['PhoneNumbers'];
    if (phones.isNotEmpty) {
      for (int i = 0; i < phones.length; i++) {
        phoneNums.add(PhoneNumber.fromJson(json, i));
      }
    }
    return Candidate(
      fName: data['Name']['First'] ?? 'Not Sepcified',
      lName: data['Name']['Last'] ?? 'Not Sepcified',
      bdate: data['DateOfBirth'] ?? 'Not Sepcified',
      emails: emails,
      phoneNums: phoneNums,
    );
  }

  @override
  String toString() {
    return '$_fName $_lName $_phoneNums $_bdate $_emails';
  }
}
