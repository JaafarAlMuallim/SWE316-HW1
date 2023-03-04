class Skill {
  String? _name;
  String? _type;
  List<String>? _section;
  int? _numMonths;
  String? _lastUsed;

  String? get name => _name;

  // set name(value) => _name = value;

  String? get type => _type;

  // set type(value) => type = value;

  List<String>? get section => _section;

  // set section(value) => _section = value;

  int? get numMonths => _numMonths;

//  set numMonths( value) => this._numMonths = value;

  String? get lastUsed => _lastUsed;

//  set lastUsed( value) => this._lastUsed = value;

  Skill(
      {required String name,
      required String? type,
      required List<String>? section,
      required int numMonths,
      required String lastUsed})
      : _name = name,
        _type = type,
        _section = section,
        _numMonths = numMonths,
        _lastUsed = lastUsed;

  factory Skill.fromJson(Map<String, dynamic> json, int index) {
    List<dynamic> data = json['Value']['Data']['Skills'];
    List<dynamic> jsonSrc = data[index]['Sources'];
    List<String> sources = [];
    if (jsonSrc.isNotEmpty) {
      for (int i = 0; i < jsonSrc.length; i++) {
        sources.add(jsonSrc[i]['Section']);
      }
    } else {
      sources.add('None Given');
    }
    return Skill(
        name: data[index]['Name'] ?? 'Not Sepcified',
        type: data[index]['Type'] ?? 'Not Sepcified',
        section: sources,
        numMonths: data[index]['NumberOfMonths'] ?? 0,
        lastUsed: data[index]['LastUsed'] ?? 'Not Specified');
  }
}
