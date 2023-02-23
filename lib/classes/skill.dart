class Skill {
  String? _name;
  final String? _type;
  List<String>? _section;
  get name => _name;

  set name(value) => _name = value;

  get type => _type;

  set type(value) => type = value;

  get section => _section;

  set section(value) => _section = value;

  Skill({required String name, String? type, List<String>? section})
      : _name = name,
        _type = type,
        _section = section;

  factory Skill.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['Skills'];
    return Skill(
      name: data[index]['Name'] ?? 'Not Sepcified',
      type: data[index]['Type'] ?? 'Not Sepcified',
      section:
          data[index]['Sources'][0]['Section'].split('/') ?? 'Not Sepcified',
    );
  }
}
