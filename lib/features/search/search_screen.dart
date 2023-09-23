import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/search/widgets/FollowList.dart';
import 'package:tiktok_challenge/features/users/models/user_profile_model.dart';
import 'package:tiktok_challenge/features/users/repos/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userRepoProvider = Provider((ref) => UserRepository());

final allProfilesProvider = FutureProvider<List<UserProfileModel>>((ref) {
  final repo = ref.watch(userRepoProvider);
  return repo.getAllProfiles().then((value) {
    print("Loaded profiles: $value");
    return value;
  });
});

class SearchScreen extends ConsumerStatefulWidget {
  static String routeName = "/search";
  static const routeURL = "/search";
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  String searchText = ""; // 검색 텍스트 상태 추가

  // 가상의 데이터 리스트
  final List<Map<String, String>> users = [
    {'nickname': 'rjmithun', 'subname': 'Mithun'},
    {'nickname': 'vicenews', 'subname': 'Vice News'},
    // ... (다른 사용자 데이터)
  ];

  @override
  Widget build(BuildContext context) {
    // 검색어에 따라 필터링된 목록을 가져옵니다.
    // List<Map<String, String>> filteredUsers =
    //     users.where((user) => user['nickname']!.contains(searchText)).toList();

    final profiles = ref.watch(allProfilesProvider);
    // print(profiles.value);
    // final List<String> images = [
    //   'assets/images/girl-1867092_1280.jpg',
    //   'assets/images/image1.jpeg',
    // ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search",
                style: TextStyle(
                    fontSize: Sizes.size32, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: Sizes.size12,
              ),
              CupertinoSearchTextField(
                onChanged: (text) {
                  // 검색어가 변경될 때마다 상태를 업데이트합니다.
                  setState(() {
                    searchText = text;
                  });
                },
              ),
              const SizedBox(
                height: Sizes.size12,
              ),

              // //여기가 하나의 listview 시작
              // for (var user in filteredUsers)
              //   FollowList(
              //     nickname: user['nickname']!,
              //     subname: user['subname']!,
              //   )
              profiles.when(
                data: (users) {
                  // 검색어에 따라 필터링된 목록을 가져옵니다.

                  var filteredUsers = searchText.isEmpty
                      ? users
                      : users
                          .where((user) => user.email.contains(searchText))
                          .toList();

                  return Column(
                    children: [
                      for (var user in filteredUsers)
                        FollowList(
                          nickname: user.email,
                          subname: user.name, // email 대신 이름을 표시
                        ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) {
                  print("err 가 났어요!!");
                  print(err);
                  print(stack);
                  return const Text('Error loading users');
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
