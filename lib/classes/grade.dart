class Grade {
  String? _metric;
  String? _value;

  String? get metric => _metric;

  // set metric(value) => _metric = value;

  String? get value => _value;

  // set value(value) => _value = value;

  Grade({required String metric, required String value})
      : _metric = metric,
        _value = value;

  factory Grade.fromJson(Map<String, dynamic> json, int index) {
    dynamic data = json['Value']['Data']['Education'][index]['Grade'];
    Grade grade = data == null
        ? Grade(metric: 'XX', value: 'XX')
        : Grade(metric: data['Metric'], value: data['Value']);
    return grade;
  }
}
