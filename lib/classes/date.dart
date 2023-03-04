class Date {
  String? _start;
  String? _end;
  int? _occupationTime;
  bool? _isCurrent;

  String? get start => _start;

  // set start(value) => _start = value;

  String? get end => _end;

  // set end(value) => _end = value;

  int? get occupationTime => _occupationTime;

  // set occupationTime(value) => _occupationTime = value;

  bool? get isCurrent => _isCurrent;

//  set isCurrent( value) => _isCurrent = value;

  Date(
      {required String start,
      required String finsih,
      required int occupation,
      required bool isCurrent})
      : _start = start,
        _end = finsih,
        _occupationTime = occupation,
        _isCurrent = isCurrent;
  factory Date.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data =
        json['Value']['Data']['WorkExperience'][index]['Dates'];
    return Date(
      start: data['StartDate'] ?? 'XXXX',
      finsih: data['EndDate'] ?? 'XXXX',
      occupation: data['MonthsInPosition'] ?? 0,
      isCurrent: data['IsCurrent'] ?? false,
    );
  }
}
