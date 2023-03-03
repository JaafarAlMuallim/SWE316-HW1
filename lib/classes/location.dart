class Location {
  String? _country;
  String? _postalCode;
  String? _city;
  String? _state;
  String? _formatted;
  get country => _country;

  // set country(value) => _country = value;

  get postalCode => _postalCode;

  // set postalCode(value) => _postalCode = value;

  get city => _city;

  // set city(value) => _city = value;

  get state => _state;

//  set state(String? value) => this._state = value;

  get formatted => _formatted;

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
  factory Location.fromJson(dynamic json,
      {required String where, int index = 0}) {
    dynamic data = json['Value']['Data'][where][index]['Location'];
    Location location = data == null
        ? Location(
            city: 'XXXX',
            code: 'XXXX',
            country: 'XXXX',
            state: 'XXXX',
            formatted: 'XXXX')
        : Location(
            country: data['Country'] ?? 'XXXX',
            code: data['PostalCode'] ?? 'XXXX',
            city: data['City'] ?? 'XXXX',
            state: data['State'] ?? 'XXXX',
            formatted: data['Formatted'] ?? 'XXXX');
    return location;
  }
}
