class Language {
  String? _language;
  String? _code;

  String? get language => _language;
  String? get code => _code;
  // set language(value) => _language = value;
  // set code(value) => _code = value;

  Language({required String language, required String code})
      : _language = language,
        _code = code;

  factory Language.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data = json['Value']['Data'];
    String language = data['Languages'][index] ?? 'None Given';
    String code = data['LanguageCodes'].isEmpty
        ? 'None Given'
        : data['LanguageCodes'][index];
    return Language(language: language, code: code);
  }
}
