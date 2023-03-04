class Website {
  String? _url;

  String? get url => _url;

  // set url(value) => _url = value;

  Website({required String? url}) {
    _url = url;
  }

  factory Website.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data = json['Value']['Data'];
    return Website(url: data['Websites'][index] ?? 'None Specified');
  }
}
