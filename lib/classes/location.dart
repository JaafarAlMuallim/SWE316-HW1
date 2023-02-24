class Location {
  String? _country;
  String? _postalCode;
  String? _city;
  get country => _country;

  set country(value) => _country = value;

  get postalCode => _postalCode;

  set postalCode(value) => _postalCode = value;

  get city => _city;

  set city(value) => _city = value;

  Location(
      {required String country, required String code, required String city}) {
    _country = country;
    _postalCode = code;
    _city = city;
  }
  factory Location.fromJson(dynamic json,
      {required String where, int index = 0}) {
    dynamic data = json['Value']['Data'][where][index]['Location'];
    Location location = data == null
        ? Location(city: 'XXXX', code: 'XXXX', country: 'XXXX')
        : Location(
            country: data['Country'] ?? 'XXXX',
            code: data['PostalCode'] ?? 'XXXX',
            city: data['City'] ?? 'XXXX',
          );
    return location;
  }
}
