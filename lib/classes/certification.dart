class Certification {
  String? _certificate;
  String? get certificate => _certificate;

  // set certificate(value) => _certificate = value;

  Certification({required String certificate}) : _certificate = certificate;

  factory Certification.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data = json['Value']['Data'];
    return Certification(certificate: data['Certifications'][index]);
  }
}
