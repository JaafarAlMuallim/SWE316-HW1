import 'package:swe_homework/classes/experience.dart';

class Candidate {
  String? _fName;
  String? _lName;
  String? _phoneNum;
  String? _email;
  DateTime? _bdate;
  List<String>? _langs;
  final Experience? exper;

  get fName => _fName;

  set fName(value) => _fName = value;

  get lName => _lName;

  set lName(value) => _lName = value;

  get phoneNum => _phoneNum;

  set phoneNum(value) => _phoneNum = value;

  get email => _email;

  set email(value) => _email = value;

  get bdate => _bdate;

  set bdate(value) => _bdate = value;

  get langs => _langs;

  set langs(value) => _langs = value;

  Candidate(
    this.exper, {
    required String fName,
    required String lName,
    required String phoneNum,
    required String email,
    DateTime? bdate,
    List<String>? langs,
  })  : _fName = fName,
        _lName = lName,
        _phoneNum = phoneNum,
        _email = email,
        _bdate = bdate,
        _langs = langs;

  factory Candidate.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
    return Candidate(
      Experience.fromJson(json),
      fName: data['Name']['First'],
      lName: data['Name']['Last'],
      phoneNum: data['PhoneNumbers'][0],
      email: data['Emails'][0],
    );
  }

  @override
  String toString() {
    return '$_fName $_lName $_phoneNum $_email $exper';
  }
}
