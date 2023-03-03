class Name {
  String? _title;
  String? _first;
  String? _last;

  get title => _title;

  // set title(value) => _title = value;

  get first => _first;

  // set first(value) => _first = value;

  get last => _last;

  // set last(value) => _last = value;

  Name({required String title, required String first, required String last})
      : _title = title,
        _first = first,
        _last = last;

  factory Name.fromJson(dynamic json) {
    dynamic data = json['Value']['Data'];
    return Name(
      title: data['Name']['Title'] ?? 'Not Specified',
      first: data['Name']['First'] ?? 'Not Sepcified',
      last: data['Name']['Last'] ?? 'Not Sepcified',
    );
  }
}
