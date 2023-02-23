class Certification {
  String? _certificate;
  get certificate => _certificate;

  set certificate(value) => _certificate = value;

  Certification({required String certificate}) : _certificate = certificate;

  factory Certification.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data'];
    return Certification(certificate: data['Certifications'][index]);
  }
}
