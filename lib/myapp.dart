import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/screens/resume_parse.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.resumes});
  final List<Resume> resumes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: ResumeParseScreen(
        resumes: resumes,
      ),
    );
  }
}
