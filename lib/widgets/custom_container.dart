import 'package:flutter/material.dart';
import 'package:swe_homework/misc/read_json.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueGrey[400],
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Column(
          children: [
            Text(
                '${Reader.resumes[0].candidate.fName} ${Reader.resumes[0].candidate.lName}'),
            Text(
                '${Reader.resumes[1].candidate.fName} ${Reader.resumes[1].candidate.lName}'),
            Text(
                '${Reader.resumes[2].candidate.fName} ${Reader.resumes[2].candidate.lName}'),
            Text('${Reader.resumes[1].certifs[0]}'),
          ],
        ));
  }
}
