import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/custom_certifs_listview.dart';
import 'package:swe_homework/widgets/custom_edu_listview.dart';
import 'package:swe_homework/widgets/custom_exp_listview.dart';
import 'package:swe_homework/widgets/custom_name_list.dart';
import 'package:swe_homework/widgets/custom_skills_listview.dart';

class ResumeParseScreen extends StatefulWidget {
  const ResumeParseScreen({super.key, required this.resumes});
  final List<Resume> resumes;

  @override
  State<ResumeParseScreen> createState() => _ResumeParseScreenState();
}

class _ResumeParseScreenState extends State<ResumeParseScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Resumes',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 400,
                        width: 300,
                        child: ListView.separated(
                          itemCount: Reader.resumes.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 60,
                              child: CustomListTile(
                                info: ListTile(
                                    hoverColor: Colors.blue[200],
                                    title: Text(
                                      Reader.resumes[index].candidate.name,
                                      style: kTextStyle.copyWith(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    tileColor: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.white,
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    }),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const VerticalDivider(
                    width: 4,
                    color: Colors.white38,
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
                      CustomExperienceListview(selected: _selectedIndex),
                      Text(
                        'Skills',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomSkillListview(selected: _selectedIndex),
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
                        'Education',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEducationListview(selected: _selectedIndex),
                      Text(
                        'Certifications',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomCertifsListview(selected: _selectedIndex),
                      const SizedBox(
                        width: 40,
                      ),
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
