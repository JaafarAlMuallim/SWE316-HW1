class Grade {
  String? _metric;
  String? _value;

  get metric => _metric;

  set metric(value) => _metric = value;

  get value => _value;

  set value(value) => _value = value;

  Grade({required String metric, required String value})
      : _metric = metric,
        _value = value;

  factory Grade.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data']['Education'][index]['Grade'];
    Grade grade = data == null
        ? Grade(metric: 'XXXX', value: 'XXXX')
        : Grade(metric: data['Metric'], value: data['Value']);
    return grade;
  }
}
