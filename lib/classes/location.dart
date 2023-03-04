class Location {
  String? _country;
  String? _postalCode;
  String? _city;
  String? _state;
  String? _formatted;

  String? get country => _country;

  // set country(value) => _country = value;

  String? get postalCode => _postalCode;

  // set postalCode(value) => _postalCode = value;

  String? get city => _city;

  // set city(value) => _city = value;

  String? get state => _state;

//  set state(String? value) => this._state = value;

  String? get formatted => _formatted;

//  set formatted( value) => this._formatted = value;

  Location(
      {required String country,
      required String code,
      required String city,
      required String state,
      required String formatted}) {
    _country = country;
    _postalCode = code;
    _city = city;
    _state = state;
    _formatted = formatted;
  }
  factory Location.fromJson(Map<String, dynamic> json,
      {String? where, int index = 0}) {
    dynamic data;
    if (where != null) {
      data = json['Value']['Data'][where][index]['Location'];
    } else {
      data = json['Value']['Data']['Location'] as dynamic;
    }
    Location location = data == null
        ? Location(
            city: 'Not Specified',
            code: 'Not Specified',
            country: 'Not Specified',
            state: 'Not Specified',
            formatted: 'Not Specified')
        : Location(
            country: data['Country'] ?? 'XXXX',
            code: data['PostalCode'] ?? 'XXXX',
            city: data['City'] ?? 'XXXX',
            state: data['State'] ?? 'XXXX',
            formatted: data['Formatted'] ?? 'XXXX');
    return location;
  }
}
