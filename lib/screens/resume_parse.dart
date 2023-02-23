import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/widgets/custom_container.dart';

class ResumeParseScreen extends StatelessWidget {
  const ResumeParseScreen({super.key, required this.resumes});
  final List<Resume> resumes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 240,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Text(
                'Resume',
                style: kTextStyle.copyWith(fontSize: 18),
              ),
              const CustomContainer()
            ],
          ),
        ),
      ),
    );
  }
}
