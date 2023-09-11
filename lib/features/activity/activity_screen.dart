import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/activity/widgets/ActivityList.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final tabs = [
    "All",
    "Replies",
    "Mentions",
    "Quotes",
    "Authorized",
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Activity'),
        titleTextStyle: const TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.w800,
            color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          // 나머지 코드
          // splashFactory: NoSplash.splashFactory,
          isScrollable: true,

          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black,
          ),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size4,
          ),
          tabs: [
            for (var tab in tabs)
              Tab(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: _tabController!.index == tabs.indexOf(tab)
                          ? Colors.black
                          : Colors.grey.shade300,
                      width: _tabController!.index == tabs.indexOf(tab)
                          ? 0.0
                          : 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController, // This was missing
              children: buildTabViews(tabs),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildTabViews(List<String> tabs) {
  List<Widget> views = [];

  for (var tab in tabs) {
    if (tab == 'All') {
      print(tab == 'All');
      views.add(
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              ActivityList(
                nickname: 'rjmithun',
                activityType: 'Mentioned you',
                isFollowed: false,
                activityTime: '4h',
                mainContents:
                    'Here\'s a thread you should follow if you love botany @jane_mobbin',
              ),
              ActivityList(
                nickname: 'john_mobbin',
                activityType:
                    'Starting out my gardening club with i dont know what i write to say',
                isFollowed: false,
                activityTime: '4h',
                mainContents: 'Count me in!',
              ),
              ActivityList(
                nickname: 'the.plantdads',
                activityType: 'Followed you',
                isFollowed: true,
                activityTime: '5h',
                mainContents: '',
              ),
              ActivityList(
                nickname: 'the.plantdads',
                activityType: 'Definitely broken! 🤔😇😇',
                isFollowed: false,
                activityTime: '5h',
                mainContents: '',
              ),
              ActivityList(
                nickname: 'theberryjungle',
                activityType: '🤔😇😇',
                isFollowed: false,
                activityTime: '5h',
                mainContents: '',
              ),
            ],
          ),
        ),
      );
    } else {
      views.add(
        Center(
          child: Text(
            tab,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      );
    }
  }

  return views;
}
