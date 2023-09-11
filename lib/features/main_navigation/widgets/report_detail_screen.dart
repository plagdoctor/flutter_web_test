import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';

class ReportDetailScreen extends StatefulWidget {
  final String? title;

  const ReportDetailScreen({Key? key, this.title}) : super(key: key);

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  void _onReport(int index) async {
    if (index == 0) return;
    await showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ReportDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
        ),
        body: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              const ListTile(
                title: Text('Why are you reporting this thread?'),
                subtitle: Text(
                  'Your report is anonymous, except if you\'re reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don\'t wait.',
                ),
              ),
              const ListTile(
                title: Text('I just don\'t like it'),
              ),
              const ListTile(
                title: Text('It\'s unlawful content under NetzDG'),
              ),
              const ListTile(
                title: Text('It\'s spam'),
              ),
              const ListTile(
                title: Text('Hate speech or symbols'),
              ),
              const ListTile(
                title: Text('Nudity or sexual activity'),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
