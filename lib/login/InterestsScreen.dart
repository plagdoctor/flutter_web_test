import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/InterestsScreenPart2.dart';
import 'package:tiktok_challenge/ui/AuthButtonWithEnable.dart';

class InterestsScreen extends StatefulWidget {
  static String routeName = "/";
  static const routeURL = "/";
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

const interests = [
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
  "Dance",
  "Outdoors",
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
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class _InterestsScreenState extends State<InterestsScreen> {
  Set<String> selectedInterestsSet = {};
  bool _isOkenableButton = false;

  void _toNextPage(BuildContext context) {
    //원래 Interest2 로 가는데 일단 홈으로 바꿔봄
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => const InterestsScreenPart2()));

    context.go("/home");
  }

  void _isSelected(int index) {
    setState(() {
      if (selectedInterestsSet.contains(interests[index])) {
        selectedInterestsSet.remove(interests[index]);
      } else {
        selectedInterestsSet.add(interests[index]);
      }
      if (selectedInterestsSet.length >= 3) {
        _isOkenableButton = true;
      } else {
        _isOkenableButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
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
                Gaps.v40,
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
                        "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
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
                Gaps.v40,
                // todo:gridview??
                Expanded(
                  child: GridView.builder(
                      itemCount: interests.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 16 / 9,
                              crossAxisSpacing: Sizes.size10,
                              mainAxisSpacing: Sizes.size10),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => _isSelected(index),
                            child: InterestCard(
                                selectedInterests: interests[index],
                                isSelected: selectedInterestsSet
                                    .contains(interests[index])),
                          )),
                )
              ],
            ),
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
                onTap: () => _toNextPage(context),
                child: AuthButtonWithEnable(
                  text: "Next",
                  icon: const FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                  isDark: true,
                  isEnable: !_isOkenableButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final String selectedInterests;
  final bool isSelected; // 카드가 선택되었는지 여부를 나타내는 속성

  const InterestCard({
    super.key,
    required this.selectedInterests,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.lightBlue : Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Stack(
        children: [
          if (isSelected)
            const Positioned(
              top: 12,
              right: 12,
              child: CircleAvatar(
                // minRadius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check,
                  color: Colors.lightBlue,
                  size: Sizes.size20,
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  selectedInterests,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
