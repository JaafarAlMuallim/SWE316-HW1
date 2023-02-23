import 'package:flutter/material.dart';
import 'package:swe_homework/classes/job.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/custom_name_list.dart';
import 'package:swe_homework/widgets/info_container.dart';

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
                  style: kTextStyle.copyWith(color: Colors.white),
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
                        width: 40,
                        child: CustomListTile(
                          info: ListTile(
                              hoverColor: Colors.blue[200],
                              title: Text(
                                Reader.resumes[index].candidate.name,
                                style: kTextStyle.copyWith(color: Colors.black),
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
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Experience',
                  style: kTextStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        Job job = Reader
                            .resumes[_selectedIndex].experience.jobs[index];
                        String text = '';
                        if (job.date.start != 'Not Specified' &&
                            job.date.end != 'Not Specified') {
                          text =
                              'From ${job.date.start.split('-')[0]} -- Until  ${job.date.end.split('-')[0]}';
                        } else if (job.date.start != 'Not Specified') {
                          text =
                              'From ${job.date.start.split('-')[0]} -- Until XXXX}';
                        } else if (job.date.end != 'Not Specified') {
                          text =
                              'From XXXX -- Until ${job.date.end.split('-')[0]}';
                        } else {
                          text = 'From XXXX -- Until XXXX';
                        }
                        return SizedBox(
                          width: 40,
                          child: InfoContainer(
                              info: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                job.jobTitle,
                                style: kTextStyle.copyWith(color: Colors.black),
                              ),
                              Text(
                                text,
                                style: kTextStyle,
                              )
                            ],
                          )),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 6,
                          ),
                      itemCount: Reader
                          .resumes[_selectedIndex].experience.jobs.length),
                ),
              ],
            ),
            // TODO show education, certifications, skills
          ],
        ),
      ),
    );
  }
}
