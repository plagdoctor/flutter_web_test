import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    this.isFollowed = false,
    required this.buttonText,
  });

  final bool isFollowed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size10),
          color: isFollowed ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black26, style: BorderStyle.solid),
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: isFollowed ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            isFollowed ? 'Following' : 'Follow',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
