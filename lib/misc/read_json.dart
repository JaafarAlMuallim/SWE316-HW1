import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:swe_homework/classes/candidate.dart';

class Reader {
  static Future<List<Candidate>> read() async {
    List<Candidate> lst = [];
    String response = await rootBundle.loadString('assets/CV_Sample_01.json');
    dynamic data = await json.decode(response);
    Candidate candidate = Candidate.fromJson(data);
    print(candidate.toString());

    return lst;
  }
}
