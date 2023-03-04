class JobClassification {
  String? _title;
  int? _managementLevel;
  String? _subMajor;
  String? _minorGroup;
  String? _majorGroup;
  int? _socCode;

  String? get title => _title;

//  set title(value) => _title = value;

  String? get subMajor => _subMajor;

//  set subMajor( value) => _subMajor = value;

  String? get minorGroup => _minorGroup;

//  set minorGroup( value) => _minorGroup = value;

  String? get majorGroup => _majorGroup;

//  set majorGroup( value) => _majorGroup = value;

  int? get socCode => _socCode;

//  set socCode( value) => _socCode = value;

  int? get managementLevel => _managementLevel;

//  set managementLevel( value) => _managementLevel = value;

  JobClassification({
    required String title,
    required int managementLevel,
    required String subMajor,
    required String minor,
    required String major,
    required int socCode,
  })  : _title = title,
        _managementLevel = managementLevel,
        _subMajor = subMajor,
        _minorGroup = minor,
        _majorGroup = major,
        _socCode = socCode;

  factory JobClassification.fromJson(Map<String, dynamic> json, int index) {
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
            managementLevel: data['managementLevel'] ?? 0,
            subMajor: data['Occupation']['SubMajorGroup'] ?? 'XXXX',
            minor: data['Occupation']['MinorGroup'] ?? 'XXXX',
            major: data['Occupation']['MajorGroup'] ?? 'XXXX',
            socCode: data['Occupation']['SocCode'] ?? 0);

    return classification;
  }
}
