class Skill {
  String? _name;
  final String? _type;
  List<String>? _section;
  String? _numMonths;
  String? _lastUsed;

  get name => _name;

  // set name(value) => _name = value;

  get type => _type;

  // set type(value) => type = value;

  get section => _section;

  // set section(value) => _section = value;

  get numMonths => _numMonths;

//  set numMonths( value) => this._numMonths = value;

  get lastUsed => _lastUsed;

//  set lastUsed( value) => this._lastUsed = value;

  Skill({required String name, String? type, List<String>? section})
      : _name = name,
        _type = type,
        _section = section;

  factory Skill.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['Skills'];
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
    );
  }
}
