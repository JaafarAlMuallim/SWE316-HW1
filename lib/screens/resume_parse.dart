import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/custom_certifs_listview.dart';
import 'package:swe_homework/widgets/custom_edu_listview.dart';
import 'package:swe_homework/widgets/custom_emails_listview.dart';
import 'package:swe_homework/widgets/custom_exp_listview.dart';
import 'package:swe_homework/widgets/custom_info_listview.dart';
import 'package:swe_homework/widgets/custom_langs_listview.dart';
import 'package:swe_homework/widgets/custom_list_tile.dart';
import 'package:swe_homework/widgets/custom_location_listview.dart';
import 'package:swe_homework/widgets/custom_phones_listview.dart';
import 'package:swe_homework/widgets/custom_skills_listview.dart';
import 'package:swe_homework/widgets/custom_webs_listview.dart';
import 'package:swe_homework/widgets/custom_job_listview.dart';

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
                          itemCount: Reader().resumes.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 60,
                              child: CustomListTile(
                                info: ListTile(
                                    hoverColor: Colors.blue[200],
                                    title: Text(
                                      '${widget.resumes[index].candidate!.name!.first!} ${widget.resumes[index].candidate!.name!.last!}',
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
                    width: 40,
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
                        'Headshot',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 4),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  widget.resumes[_selectedIndex].headshotUrl !=
                                          'None Given'
                                      ? NetworkImage(widget
                                          .resumes[_selectedIndex].headshotUrl!)
                                      : const AssetImage(
                                          'assets/images/person.jpg',
                                        ) as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Location',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomLocationListview(selected: _selectedIndex),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Educations',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEducationListview(selected: _selectedIndex),
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
                      Text('General Info',
                          style: kTextStyle.copyWith(
                              color: Colors.white, fontSize: 16)),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInfoListview(selected: _selectedIndex),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Email(s)',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEmailListview(selected: _selectedIndex),
                      const SizedBox(
                        width: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Experience',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomExpListview(selected: _selectedIndex),
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
                      CustomCertifsListview(selected: _selectedIndex),
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
                        'Phone Number(s)',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomPhoneListview(selected: _selectedIndex),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Languages',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomLangsListview(selected: _selectedIndex),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Jobs',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomJobsListview(selected: _selectedIndex),
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
                      CustomWebListview(selected: _selectedIndex),
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
