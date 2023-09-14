import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/settings/settings_screen.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  static String routeURL = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onNextPage(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const SettingScreen(),
    //   ),
    // );
    context.push(SettingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: DefaultTabController(
            // initialIndex: widget.tab == "likes" ? 1 : 0,
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    stretch: true,
                    pinned: true,
                    backgroundColor: Colors.white,
                    collapsedHeight: 60,
                    expandedHeight: 80,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.earthAsia,
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.instagram,
                            ),
                            Gaps.h16,
                            GestureDetector(
                              onTap: () => _onNextPage(context),
                              child: const FaIcon(
                                FontAwesomeIcons.bars,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: CustomDelegate(),
                    floating: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size16),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Gaps.v20,

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
                                                color: Colors.black,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Sizes.size48),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: const Center(
                                                child: FaIcon(
                                                    FontAwesomeIcons.plus,
                                                    color: Colors.white,
                                                    size: Sizes.size16),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //여기까지가 종료
                                        const Divider(
                                          color: Colors.black45,
                                          height: 1,
                                          thickness: 0.3,
                                          endIndent: 0, // 텍스트 전의 간격
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Gaps.h4,
                                                    const Text(
                                                      'shityoushouldcareabout',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Sizes.size14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Gaps.h2,
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .solidCircleCheck,
                                                      size: Sizes.size16,
                                                      color:
                                                          Colors.blue.shade500,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Gaps.h4,
                                                    const Text(
                                                      '2h',
                                                      style: TextStyle(
                                                        fontSize: Sizes.size16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    Gaps.h20,
                                                    GestureDetector(
                                                      child: const FaIcon(
                                                          FontAwesomeIcons
                                                              .ellipsis),
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Text(
                                              'Vine after seeing the Threads logo unveiled if you\'re reading this, go whater that thirsty plant',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Sizes.size14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Gaps.v10,
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Sizes.size8),
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
                                    const Text(
                                      '36 replies',
                                      style: TextStyle(
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Gaps.h10,
                                    const Text(
                                      '391 likes',
                                      style: TextStyle(
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            //여기까지가 종료
                            const Divider(
                              color: Colors.black45,
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
                                                color: Colors.black,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Sizes.size48),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: const Center(
                                                child: FaIcon(
                                                    FontAwesomeIcons.plus,
                                                    color: Colors.white,
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
                                                  color: Colors.grey.shade300,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Gaps.h4,
                                                    const Text(
                                                      'pubity',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Sizes.size14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Gaps.h2,
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .solidCircleCheck,
                                                      size: Sizes.size16,
                                                      color:
                                                          Colors.blue.shade500,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Gaps.h4,
                                                    const Text(
                                                      '2m',
                                                      style: TextStyle(
                                                        fontSize: Sizes.size16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    Gaps.h20,
                                                    GestureDetector(
                                                      child: const FaIcon(
                                                          FontAwesomeIcons
                                                              .ellipsis),
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Text(
                                              'Vine after seeing the Threads logo unveiled',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Sizes.size14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Gaps.v10,
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Sizes.size8),
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
                                    const Text(
                                      '36 replies',
                                      style: TextStyle(
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Gaps.h10,
                                    const Text(
                                      '391 likes',
                                      style: TextStyle(
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                        const Divider(
                          color: Colors.black45,
                          height: 1,
                          thickness: 0.3,
                          endIndent: 0, // 텍스트 전의 간격
                        ),
                      ],
                    ),
                  ),

                  //todo Replies
                  const Center(
                    child: Text('Page two'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Jane',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.size28,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          const Text(
                            'jane_mobbin',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gaps.h10,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size8,
                              horizontal: Sizes.size16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size40),
                              color: Colors.grey[200],
                            ),
                            child: const Text(
                              'threads.net',
                              style: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Plant enthusiast!',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //profile image
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
                ],
              ),
              Gaps.v4,
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                      horizontal: Sizes.size48,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size10),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black26, style: BorderStyle.solid),
                    ),
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Gaps.h4,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                      horizontal: Sizes.size48,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size10),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black26, style: BorderStyle.solid),
                    ),
                    child: const Text(
                      'Share profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black,
                labelPadding: EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                ),
                labelColor: Colors.black,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                    ),
                    child: Text('Threads'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                    ),
                    child: Text('Replies'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
