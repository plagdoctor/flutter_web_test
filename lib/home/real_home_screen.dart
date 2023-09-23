import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/main_navigation/widgets/report_screen.dart';
import 'package:tiktok_challenge/util/utils.dart';

class RealHomeScreen extends StatefulWidget {
  static String routeName = "/realhome";
  static const routeURL = "/realhome";
  const RealHomeScreen({super.key});

  @override
  State<RealHomeScreen> createState() => _RealHomeScreenState();
}

class _RealHomeScreenState extends State<RealHomeScreen> {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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

                                //여기까지가 종료
                                Divider(
                                  color: isDarkMode(context)
                                      ? null
                                      : Colors.black45,
                                  height: 1,
                                  thickness: 0.3,
                                  endIndent: 0, // 텍스트 전의 간격
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                              onTap: () =>
                                                  _onReportTap(context),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
