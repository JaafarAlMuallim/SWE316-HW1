import 'package:flutter/material.dart';
import 'package:swe_homework/classes/experience.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.info});
  final Experience info;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  static int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: Reader.resumes.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
              Reader.resumes[index].candidate.name,
              style: kTextStyle.copyWith(color: Colors.black),
            ),
            tileColor: selectedIndex == index ? Colors.blue : Colors.white,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            });
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 4),
    );
  }
}
