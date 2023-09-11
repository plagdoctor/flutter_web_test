import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';

class CustomizeTwitter extends StatefulWidget {
  const CustomizeTwitter({super.key});

  @override
  State<CustomizeTwitter> createState() => _CustomizeTwitterState();
}

class _CustomizeTwitterState extends State<CustomizeTwitter> {
  bool _isSwitchedOn = false;
  void _onChanged(bool value) {
    setState(() {
      _isSwitchedOn = value;
    });
  }

  void _onBack(BuildContext context) {
    Navigator.of(context).pop(_isSwitchedOn);
  }

  void _onSignUpGoBackTap(BuildContext context) {
    Navigator.of(context).pop(_isSwitchedOn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _onBack(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16, // 글자 크기 조정
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Gaps.h80,
                    Gaps.h10,
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
              const Text(
                "Customize your Experience",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v36,
              const Text(
                "Track where you see Twitter content across the web",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              Row(
                children: [
                  const Flexible(
                    child: Text(
                      "Twitter Uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CupertinoSwitch(value: _isSwitchedOn, onChanged: _onChanged),
                ],
              ),
              Gaps.v28,
              RichText(
                text: const TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.black54,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        color: Color(0xFF4693D9),
                      ),
                    ),
                    TextSpan(
                      text: ',',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF4693D9),
                      ),
                    ),
                    TextSpan(
                      text: ', and ',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: 'Cookie Use',
                      style: TextStyle(
                        color: Color(0xFF4693D9),
                      ),
                    ),
                    TextSpan(
                      text:
                          '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: 'Learn more',
                      style: TextStyle(
                        color: Color(0xFF4693D9),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v96,
              GestureDetector(
                onTap: () => _onSignUpGoBackTap(context),
                child: AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                  text: "Next",
                  isDark: _isSwitchedOn,
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () => Navigator.of(context).pop(),
              //     child: const Text('Go Back'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
