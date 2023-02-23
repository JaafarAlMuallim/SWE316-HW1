import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Resume> resumes = await Reader.read();
  runApp(MyApp(
    resumes: resumes,
  ));
}
