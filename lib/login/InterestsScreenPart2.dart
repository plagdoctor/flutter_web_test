import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/LoginScreen.dart';
import 'package:tiktok_challenge/login/widgets/InterestButton.dart';
import 'package:tiktok_challenge/ui/AuthButtonWithEnable.dart';

const musicInterests = [
  "Rap",
  "Pop",
  "K-Pop",
  "Jazz",
  "Rock",
  "Classical",
  "Blues",
  "EDM",
  "R&B",
  "Country",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
];

const entertainmentInterests = [
  "Anime",
  "Movies",
  "Harry Potter",
  "Television Shows",
  "Books",
  "Musicals",
  "Video Games",
  "Comics",
  "Theatre",
  "Virtual Reality",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
];

class InterestsScreenPart2 extends StatefulWidget {
  static String routeName = "/";
  static const routeURL = "/";
  const InterestsScreenPart2({super.key});

  @override
  State<InterestsScreenPart2> createState() => _InterestsScreenPart2State();
}

class _InterestsScreenPart2State extends State<InterestsScreenPart2> {
  final ScrollController _scrollController = ScrollController();

  final ScrollController _scrollController2 = ScrollController();

  void _toNextPage(BuildContext context) {
    context.go("/home");
  }

  int _selectedInterestsCount = 0;

  Set<String> selectedInterestsSet = {}; // 선택된 관심사를 추적하는 Set

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterestsSet.contains(interest)) {
        _selectedInterestsCount--;
        selectedInterestsSet.remove(interest);
      } else {
        _selectedInterestsCount++;
        selectedInterestsSet.add(interest);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const FaIcon(FontAwesomeIcons.arrowLeft),
                    ),
                    Gaps.h80,
                    Gaps.h60,
                    const Flexible(
                      child: Image(
                          height: Sizes.size72,
                          width: Sizes.size72,
                          image: AssetImage("assets/images/twitterLogo.png")),
                    ),
                  ],
                ),
              ),
              Gaps.v10,
              const Row(
                children: [
                  Gaps.h20,
                  Expanded(
                    child: Text(
                      "What do you want to see on Twitter?",
                      style: TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              const Row(
                children: [
                  Gaps.h20,
                  Flexible(
                    child: Text(
                      "Interests are used to personalize your experience and will be visible on your profile.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 0.5,
              ),
              Gaps.v10,
              const Row(
                children: [
                  Gaps.h20,
                  Expanded(
                    child: Text(
                      "Music",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 1200,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(
                          musicInterests.length,
                          (index) => InterestButton(
                              onTap: () =>
                                  _toggleInterest(musicInterests[index]),
                              interest: musicInterests[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.v10,
              const Row(
                children: [
                  Gaps.h20,
                  Expanded(
                    child: Text(
                      "Entertainment",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController2,
                  child: SingleChildScrollView(
                    controller: _scrollController2,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 1200,
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: List.generate(
                          entertainmentInterests.length,
                          (index) => InterestButton(
                              onTap: () => _toggleInterest(
                                  entertainmentInterests[index]),
                              interest: entertainmentInterests[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FractionallySizedBox(
              widthFactor: 0.25,
              child: GestureDetector(
                onTap: _selectedInterestsCount >= 3
                    ? () => _toNextPage(context)
                    : null,
                child: AuthButtonWithEnable(
                  text: "Next",
                  icon: const FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                  isDark: true,
                  isEnable: _selectedInterestsCount >= 3 ? false : true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
