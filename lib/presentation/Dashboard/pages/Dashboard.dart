import 'package:flutter/material.dart';

import 'components/announcements.dart';
import 'components/banner.dart';
import 'components/header.dart';
import 'components/upcomingExams.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xfff3f4f6),
        child: Column(
          children: [
            const DashboardHeader(),
            const ExamBanner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Announcements(),
                UpcomingExams(),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ));
  }
}
