import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/ui/FollowButton.dart';

class FollowList extends StatefulWidget {
  const FollowList({super.key, required this.nickname, required this.subname});
  final String nickname;
  final String subname;
  @override
  State<FollowList> createState() => _FollowListState();
}

bool followSwitch = false;

class _FollowListState extends State<FollowList> {
  void _onClickFollow() {
    setState(() {
      followSwitch = !followSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Gaps.v12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    faker.image.image(
                      keywords: ['actors'],
                      random: true,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Gaps.h12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nickname,
                        style: const TextStyle(
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
                  Text(
                    widget.subname,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  Gaps.v4,
                  const Text(
                    '26.6K followers',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GestureDetector(
                  onTap: _onClickFollow,
                  child: FollowButton(
                      isFollowed: followSwitch, buttonText: 'Follow'),
                ),
              ),
            ],
          ),
          Gaps.v12,
          const Divider(
            color: Colors.black45,
            height: 1,
            thickness: 0.3,
            endIndent: 0, // 텍스트 전의 간격
          ),
        ],
      ),
    );
  }
}
