import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/search/widgets/FollowList.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";
  static const routeURL = "/search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // final List<String> images = [
    //   'assets/images/girl-1867092_1280.jpg',
    //   'assets/images/image1.jpeg',
    // ];
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                    fontSize: Sizes.size32, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: Sizes.size12,
              ),
              CupertinoSearchTextField(),
              SizedBox(
                height: Sizes.size12,
              ),

              //여기가 하나의 listview 시작
              FollowList(
                nickname: 'rjmithun',
                subname: 'Mithun',
              ),
              FollowList(
                nickname: 'vicenews',
                subname: 'Vice News',
              ),
              FollowList(
                nickname: 'trevornoah',
                subname: 'Trevor Noah',
              ),
              FollowList(
                nickname: 'condenasttraveller',
                subname: 'Conde NAst Travller',
              ),
              FollowList(
                nickname: 'chef_pillai',
                subname: 'king chef',
              ),
              FollowList(
                nickname: 'malala',
                subname: 'ms. malalala',
              ),
              FollowList(
                nickname: 'sebin_cyriac',
                subname: 'fishing freak',
              ),
              FollowList(
                nickname: 'rjmithun',
                subname: 'Mithun',
              ),
              FollowList(
                nickname: 'vicenews',
                subname: 'Vice News',
              ),
              FollowList(
                nickname: 'trevornoah',
                subname: 'Trevor Noah',
              ),
              FollowList(
                nickname: 'condenasttraveller',
                subname: 'Conde NAst Travller',
              ),
              FollowList(
                nickname: 'chef_pillai',
                subname: 'king chef',
              ),
              FollowList(
                nickname: 'malala',
                subname: 'ms. malalala',
              ),
              FollowList(
                nickname: 'sebin_cyriac',
                subname: 'fishing freak',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
