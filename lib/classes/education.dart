class Education {
  String? _org;
  String? _eduLevel;
  String? _certificate;
  double? _gpa;
  int? _total;
  String? _location;

  get org => _org;

  set org(value) => _org = value;

  get eduLevel => _eduLevel;

  set eduLevel(value) => _eduLevel = value;

  get certificate => _certificate;

  set certificate(value) => _certificate = value;

  get gpa => _gpa;

  set gpa(value) => _gpa = value;

  get total => _total;

  set total(value) => _total = value;

  get location => _location;

  set location(value) => _location = value;

  Education(
      {required String org,
      required String eduLevel,
      required String certificate,
      required double gpa,
      required int total,
      required String location})
      : _org = org,
        _eduLevel = eduLevel,
        _certificate = certificate,
        _gpa = gpa,
        _total = total,
        _location = location;

  factory Education.fromJson(dynamic json) {
    dynamic data = json['Value']['Data']['Education'][0];
    return Education(
        org: data['Organization'],
        eduLevel: data['Accreditation']['EducationLevel'],
        certificate: data['Accreditation']['Education'],
        gpa: data['Grade']['Value'].split('/')[0] as double,
        total: data['Grade']['Value'].split('/')[1],
        location: data['Location']['Formatted']);
  }
}
