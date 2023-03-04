import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/widgets/custom_emails_listview.dart';
import 'package:swe_homework/widgets/custom_info_listview.dart';
import 'package:swe_homework/widgets/custom_langs_listview.dart';
import 'package:swe_homework/widgets/custom_location_listview.dart';
import 'package:swe_homework/widgets/custom_phones_listview.dart';

class GeneralInfoScreen extends StatelessWidget {
  const GeneralInfoScreen(
      {super.key, required this.resumes, required this.selected});
  final List<Resume> resumes;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Info'),
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
                              image: resumes[selected].headshotUrl !=
                                      'None Given'
                                  ? NetworkImage(resumes[selected].headshotUrl!)
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
                      CustomLocationListview(selected: selected),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  // Text(
                  //   'Educations',
                  //   style: kTextStyle.copyWith(
                  //       color: Colors.white, fontSize: 16),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // CustomEducationListview(selected: selectedIndex),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   'Skills',
                  //   style: kTextStyle.copyWith(
                  //       color: Colors.white, fontSize: 16),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // CustomSkillListview(selected: selectedIndex),
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
                      CustomInfoListview(selected: selected),
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
                      CustomEmailListview(selected: selected),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'Experience',
                      //   style: kTextStyle.copyWith(
                      //       color: Colors.white, fontSize: 16),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // CustomExpListview(selected: selectedIndex),
                      // const SizedBox(
                      //   width: 40,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Certifications',
                      //   style: kTextStyle.copyWith(
                      //       color: Colors.white, fontSize: 16),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // CustomCertifsListview(selected: selectedIndex),
                      // const SizedBox(
                      //   width: 40,
                      // ),
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
                      CustomPhoneListview(selected: selected),
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
                      CustomLangsListview(selected: selected),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'Jobs',
                      //   style: kTextStyle.copyWith(
                      //       color: Colors.white, fontSize: 16),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // CustomJobsListview(selected: selectedIndex),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Websites',
                      //   style: kTextStyle.copyWith(
                      //       color: Colors.white, fontSize: 16),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // CustomWebListview(selected: selectedIndex),
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
