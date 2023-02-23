class Date {
  String? _start;
  String? _end;
  int? _occupationTime;

  get start => _start;

  set start(value) => _start = value;

  get end => _end;

  set end(value) => _end = value;

  get occupationTime => _occupationTime;

  set occupationTime(value) => _occupationTime = value;

  Date({required String start, required String finsih, required int occupation})
      : _start = start,
        _end = finsih,
        _occupationTime = occupation;
  factory Date.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['WorkExperience'][index]['Dates'];
    return Date(
      start: data['StartDate'] ?? 'Not Specified',
      finsih: data['EndDate'] ?? 'Not Specified',
      occupation: data['MonthsInPosition'] ?? 0,
    );
  }
}
