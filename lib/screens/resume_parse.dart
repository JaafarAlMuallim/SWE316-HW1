import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/screens/experience_screen.dart';
import 'package:swe_homework/screens/general_info_screen.dart';

class ResumeParseScreen extends StatefulWidget {
  const ResumeParseScreen({super.key, required this.resumes});
  final List<Resume> resumes;

  @override
  State<ResumeParseScreen> createState() => _ResumeParseScreenState();
}

class _ResumeParseScreenState extends State<ResumeParseScreen> {
  int _selectedIndex = 0;
  bool hovered = false;
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 300,
          width: 1000,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  tileColor: const Color(0XFF219ebc),
                  hoverColor: const Color(0XFF8ecae6),
                  onFocusChange: (value) {
                    if (value) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          '${widget.resumes[index].candidate!.name!.first!} ${widget.resumes[index].candidate!.name!.last!}',
                          style: kTextStyle.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          child: MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                _selectedIndex = index;
                                hovered = true;
                                current = 0;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _selectedIndex = index;
                                hovered = false;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                // color: Colors.blue[800],
                                color: hovered &&
                                        _selectedIndex == index &&
                                        current == 0
                                    ? khoveredColor
                                    : kUnoveredColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'View General Info',
                                  style: kTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GeneralInfoScreen(
                                        resumes: widget.resumes,
                                        selected: _selectedIndex)));
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          child: MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                _selectedIndex = index;
                                hovered = true;
                                current = 1;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _selectedIndex = index;
                                hovered = false;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                color: hovered &&
                                        _selectedIndex == index &&
                                        current == 1
                                    ? khoveredColor
                                    : kUnoveredColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'View Expereince Info',
                                  style: kTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            _selectedIndex = index;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExpereinceScreen(
                                        resumes: widget.resumes,
                                        selected: _selectedIndex)));
                          },
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GeneralInfoScreen(
                                resumes: widget.resumes,
                                selected: _selectedIndex)));
                  },
                ),
              );
            },
            itemCount: widget.resumes.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 6,
              );
            },
          ),
        ),
      ),
    );
  }
}
