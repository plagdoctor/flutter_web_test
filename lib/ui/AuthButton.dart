import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final bool isDark;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = isDark ? Colors.white : Colors.black;
    Color containerColor = isDark ? Colors.black : Colors.white;

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size14),
        // color: containerColor,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 47.0),
                child: icon.icon == FontAwesomeIcons.solidArrowAltCircleUp
                    ? const SizedBox.shrink()
                    : icon,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w800,
                color: textColor, // 색상 조정
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
