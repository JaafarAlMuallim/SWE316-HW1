class Name {
  String? _title;
  String? _first;
  String? _middle;
  String? _last;

  String? get title => _title;

  // set title(value) => _title = value;

  String? get first => _first;

  // set first(value) => _first = value;

  String? get middle => _middle;

  // set first(value) => _first = value;

  String? get last => _last;

  // set last(value) => _last = value;

  Name(
      {required String title,
      required String first,
      required String middle,
      required String last})
      : _title = title,
        _first = first,
        _middle = middle,
        _last = last;

  factory Name.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['Value']['Data'];
    return Name(
      title: data['Name']['Title'] ?? 'Not Specified',
      first: data['Name']['First'] ?? 'Not Sepcified',
      middle: data['Name']['Middle'].isEmpty
          ? 'Not Sepcified'
          : data['Name']['Middle'],
      last: data['Name']['Last'] ?? 'Not Sepcified',
    );
  }
}
