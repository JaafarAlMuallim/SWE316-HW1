import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/widgets/custom_exp_listview.dart';
import 'package:swe_homework/widgets/custom_job_listview.dart';
import 'package:swe_homework/widgets/custom_skills_listview.dart';
import 'package:swe_homework/widgets/custom_webs_listview.dart';

import '../widgets/custom_certifs_listview.dart';
import '../widgets/custom_edu_listview.dart';

class ExpereinceScreen extends StatelessWidget {
  const ExpereinceScreen(
      {super.key, required this.resumes, required this.selected});
  final List<Resume> resumes;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Educations',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEducationListview(selected: selected),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Skills',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomSkillListview(selected: selected),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Experience',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomExpListview(selected: selected),
                      const SizedBox(
                        width: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Certifications',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomCertifsListview(selected: selected),
                      const SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Jobs',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomJobsListview(selected: selected),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Websites',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomWebListview(selected: selected),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
