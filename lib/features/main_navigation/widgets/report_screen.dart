import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/main_navigation/widgets/report_detail_screen.dart';

class ReportScreen extends StatefulWidget {
  final String? title;

  const ReportScreen({Key? key, this.title}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  void _onReport(int index) async {
    if (index == 0) return;
    await showModalBottomSheet(
      // anchorPoint: const Offset(0, -30),
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
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              separatorBuilder: (context, index) => Gaps.v20,
              itemCount: 2,
              itemBuilder: (context, index) => Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size28,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size20),
                        color: const Color(0xFFF5F5F5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              index == 0 ? "Unfollow" : "Hide",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Gaps.v20,
                          const Divider(
                            color: Colors.black45,
                            height: 1,
                            thickness: 0.3,
                            endIndent: 0, // 텍스트 전의 간격
                          ),
                          Gaps.v20,
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: GestureDetector(
                              onTap: () => _onReport(index),
                              child: Text(
                                index == 0 ? "Mute" : "Report",
                                style: TextStyle(
                                    color: index == 0
                                        ? Colors.black
                                        : Colors.red.shade800,
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
