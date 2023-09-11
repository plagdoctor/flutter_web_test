import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/ui/FollowButton.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({
    super.key,
    required this.nickname,
    required this.activityType,
    required this.isFollowed,
    required this.activityTime,
    required this.mainContents,
  });
  final String nickname;
  final String activityType;
  final bool isFollowed;
  final String activityTime;
  final String mainContents;

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  bool followSwitch = false;

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                        Text(
                          widget.activityTime,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.activityType,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                    Gaps.v4,
                    Flexible(
                      child: Text(
                        widget.mainContents,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isFollowed)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 140,
                    child: GestureDetector(
                      onTap: _onClickFollow,
                      child: FollowButton(
                          isFollowed: followSwitch, buttonText: 'Following'),
                    ),
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
