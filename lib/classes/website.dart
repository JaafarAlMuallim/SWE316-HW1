class Website {
  String? _url;
  get url => _url;

  // set url(value) => _url = value;

  Website({required String url}) {
    url = url;
  }

  factory Website.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data'];
    return Website(
      url: data['Websites'][index],
    );
  }
}
