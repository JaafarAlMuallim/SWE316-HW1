class JobClassification {
  String? _title;
  String? _subMajor;
  String? _minorGroup;
  String? _majorGroup;
  int? _socCode;
  int? _managementLevel;

  get title => _title;

//  set title(value) => _title = value;

  get subMajor => _subMajor;

//  set subMajor( value) => _subMajor = value;

  get minorGroup => _minorGroup;

//  set minorGroup( value) => _minorGroup = value;

  get majorGroup => _majorGroup;

//  set majorGroup( value) => _majorGroup = value;

  get socCode => _socCode;

//  set socCode( value) => _socCode = value;

  get managementLevel => _managementLevel;

//  set managementLevel( value) => _managementLevel = value;

  JobClassification(
      {required String title,
      required String subMajor,
      required String minor,
      required String major,
      required int socCode,
      required int managementLevel})
      : _title = title,
        _subMajor = subMajor,
        _minorGroup = minor,
        _majorGroup = major,
        _socCode = socCode,
        _managementLevel = managementLevel;

  factory JobClassification.fromJson(dynamic json, int index) {
    dynamic data =
        json['Value']['Data']['WorkExperience'][index]['Classification'];
    JobClassification classification = data == null
        ? JobClassification(
            title: 'XXXX',
            subMajor: 'XXXX',
            minor: 'XXXX',
            major: 'XXXX',
            socCode: 0,
            managementLevel: 0)
        : JobClassification(
            title: data['Occupation']['Title'] ?? 'XXXX',
            subMajor: data['Occupation']['SubMajorGroup'] ?? 'XXXX',
            minor: data['Occupation']['MinorGroup'] ?? 'XXXX',
            major: data['Occupation']['MajorGroup'] ?? 'XXXX',
            managementLevel: data['managementLevel'] ?? 0,
            socCode: data['Occupation']['SocCode'] ?? 0);

    return classification;
  }
}
