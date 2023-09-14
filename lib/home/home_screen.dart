import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/main_navigation/widgets/report_screen.dart';
import 'package:tiktok_challenge/util/utils.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  static const routeURL = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onReportTap(BuildContext context) async {
    await showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ReportScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/girl-1867092_1280.jpg',
      'assets/images/image1.jpeg',
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Gaps.v20,
                  Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        height: 40,
                        'assets/icons/Inlined_logo.svg',
                        color: isDarkMode(context) ? null : Colors.black45,
                      ),
                      iconSize: 2,
                    ),
                  ),
                  Column(
                    children: [
                      // todo 이미지 아바타3개 + 36replies . 391 likes
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                foregroundImage: NetworkImage(
                                  faker.image.image(
                                    keywords: ['actors'],
                                    random: true,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1,
                                child: Transform.translate(
                                  offset: const Offset(
                                    15,
                                    -20,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDarkMode(context)
                                          ? null
                                          : Colors.black,
                                      border: Border.all(
                                          color: isDarkMode(context)
                                              ? Colors.black
                                              : Colors.white,
                                          width: 3),
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size48),
                                    ),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: FaIcon(FontAwesomeIcons.plus,
                                          color: isDarkMode(context)
                                              ? null
                                              : Colors.black45,
                                          size: Sizes.size16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 280,
                                child: IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalDivider(
                                        width: Sizes.size40,
                                        thickness: Sizes.size3,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.grey.shade300,
                                        indent: Sizes.size12,
                                        endIndent: Sizes.size32,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //여기까지가 종료
                              Divider(
                                color:
                                    isDarkMode(context) ? null : Colors.black45,
                                height: 1,
                                thickness: 0.3,
                                endIndent: 0, // 텍스트 전의 간격
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Gaps.h4,
                                          Text(
                                            'shityoushouldcareabout',
                                            style: TextStyle(
                                              color: isDarkMode(context)
                                                  ? null
                                                  : Colors.black,
                                              fontSize: Sizes.size14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Gaps.h2,
                                          FaIcon(
                                            FontAwesomeIcons.solidCircleCheck,
                                            size: Sizes.size16,
                                            color: Colors.blue.shade500,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Gaps.h4,
                                          Text(
                                            '2h',
                                            style: TextStyle(
                                              fontSize: Sizes.size16,
                                              fontWeight: FontWeight.w500,
                                              color: isDarkMode(context)
                                                  ? null
                                                  : Colors.black54,
                                            ),
                                          ),
                                          Gaps.h20,
                                          GestureDetector(
                                            child: const FaIcon(
                                                FontAwesomeIcons.ellipsis),
                                            onTap: () => _onReportTap(context),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Vine after seeing the Threads logo unveiled if you\'re reading this, go whater that thirsty plant',
                                    style: TextStyle(
                                      color: isDarkMode(context)
                                          ? null
                                          : Colors.black,
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Gaps.v10,
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size8),
                                    child: Image(
                                      image: NetworkImage(
                                        faker.image.image(
                                          keywords: ['debate'],
                                          random: true,
                                          width: 1280,
                                          height: 960,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.heart,
                                        size: Sizes.size20,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.comment,
                                        size: Sizes.size20,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.arrowsRotate,
                                        size: Sizes.size20,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.paperPlane,
                                        size: Sizes.size20,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.black87,
                                      ),
                                      Gaps.h10,
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Gaps.v40,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Transform.scale(
                                scale: 0.9,
                                child: Transform.translate(
                                  offset: const Offset(
                                    -15,
                                    -5,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/42507121?v=4"),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1.20,
                                child: Transform.translate(
                                  offset: const Offset(
                                    20,
                                    -45,
                                  ),
                                  child: CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                      faker.image.image(
                                        keywords: ['actors'],
                                        random: true,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Transform.translate(
                                  offset: const Offset(
                                    20,
                                    -70,
                                  ),
                                  child: CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                      faker.image.image(
                                        keywords: ['actors'],
                                        random: true,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.h40,
                          Text(
                            '36 replies',
                            style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.w500,
                              color:
                                  isDarkMode(context) ? null : Colors.black54,
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            '391 likes',
                            style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.w500,
                              color:
                                  isDarkMode(context) ? null : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //여기까지가 종료
                  Divider(
                    color: isDarkMode(context) ? null : Colors.black45,
                    height: 1,
                    thickness: 0.3,
                    endIndent: 0, // 텍스트 전의 간격
                  ),
                  Gaps.v20,

                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                foregroundImage: NetworkImage(
                                  faker.image.image(
                                    keywords: ['actors'],
                                    random: true,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1,
                                child: Transform.translate(
                                  offset: const Offset(
                                    15,
                                    -20,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDarkMode(context)
                                          ? null
                                          : Colors.black,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size48),
                                    ),
                                    height: 30,
                                    width: 30,
                                    child: Center(
                                      child: FaIcon(FontAwesomeIcons.plus,
                                          color: isDarkMode(context)
                                              ? null
                                              : Colors.white,
                                          size: Sizes.size16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 280,
                                child: IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalDivider(
                                        width: Sizes.size40,
                                        thickness: Sizes.size3,
                                        color: isDarkMode(context)
                                            ? null
                                            : Colors.grey.shade300,
                                        indent: Sizes.size1,
                                        endIndent: Sizes.size20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Gaps.h4,
                                          Text(
                                            'pubity',
                                            style: TextStyle(
                                              color: isDarkMode(context)
                                                  ? null
                                                  : Colors.black,
                                              fontSize: Sizes.size14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Gaps.h2,
                                          FaIcon(
                                            FontAwesomeIcons.solidCircleCheck,
                                            size: Sizes.size16,
                                            color: Colors.blue.shade500,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Gaps.h4,
                                          Text(
                                            '2m',
                                            style: TextStyle(
                                              fontSize: Sizes.size16,
                                              fontWeight: FontWeight.w500,
                                              color: isDarkMode(context)
                                                  ? null
                                                  : Colors.black54,
                                            ),
                                          ),
                                          Gaps.h20,
                                          GestureDetector(
                                            child: const FaIcon(
                                                FontAwesomeIcons.ellipsis),
                                            onTap: () => _onReportTap(context),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Vine after seeing the Threads logo unveiled',
                                    style: TextStyle(
                                      color: isDarkMode(context)
                                          ? null
                                          : Colors.black,
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Gaps.v10,
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size8),
                                    child: Image(
                                      image: NetworkImage(
                                        faker.image.image(
                                          keywords: ['debate'],
                                          random: true,
                                          width: 1280,
                                          height: 960,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.v10,
                                  const Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.heart,
                                        size: Sizes.size20,
                                        color: Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.comment,
                                        size: Sizes.size20,
                                        color: Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.arrowsRotate,
                                        size: Sizes.size20,
                                        color: Colors.black87,
                                      ),
                                      Gaps.h10,
                                      FaIcon(
                                        FontAwesomeIcons.paperPlane,
                                        size: Sizes.size20,
                                        color: Colors.black87,
                                      ),
                                      Gaps.h10,
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // todo 이미지 아바타3개 + 36replies . 391 likes
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Transform.scale(
                                scale: 0.9,
                                child: Transform.translate(
                                  offset: const Offset(
                                    -15,
                                    -5,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/42507121?v=4"),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 1.20,
                                child: Transform.translate(
                                  offset: const Offset(
                                    20,
                                    -45,
                                  ),
                                  child: CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                      faker.image.image(
                                        keywords: ['actors'],
                                        random: true,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Transform.translate(
                                  offset: const Offset(
                                    20,
                                    -70,
                                  ),
                                  child: CircleAvatar(
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                      faker.image.image(
                                        keywords: ['actors'],
                                        random: true,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.h40,
                          Text(
                            '36 replies',
                            style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.w500,
                              color:
                                  isDarkMode(context) ? null : Colors.black54,
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            '391 likes',
                            style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.w500,
                              color:
                                  isDarkMode(context) ? null : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              Divider(
                color: isDarkMode(context) ? null : Colors.black45,
                height: 1,
                thickness: 0.3,
                endIndent: 0, // 텍스트 전의 간격
              ),
            ],
          ),
        ),
      ),
    );
  }
}
