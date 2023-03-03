class Date {
  String? _start;
  String? _end;
  int? _occupationTime;
  bool? _isCurrent;
  get start => _start;

  // set start(value) => _start = value;

  get end => _end;

  // set end(value) => _end = value;

  get occupationTime => _occupationTime;

  // set occupationTime(value) => _occupationTime = value;

  get isCurrent => _isCurrent;

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
  factory Date.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['WorkExperience'][index]['Dates'];
    return Date(
      start: data['StartDate'] ?? 'XXXX',
      finsih: data['EndDate'] ?? 'XXXX',
      occupation: data['MonthsInPosition'] ?? 0,
      isCurrent: data['IsCurrent'] ?? false,
    );
  }
}
