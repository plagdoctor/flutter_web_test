import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/SignUpFormScreen.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';

class LoginScreen extends StatelessWidget {
  static const routeURL = "/login";
  static const routeName = "login";
  const LoginScreen({super.key});

  // void _onLoginTap(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const LoginScreen(),
  //     ),
  //   );
  void _onSignUpTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v24,
              const Image(
                  height: Sizes.size72,
                  width: Sizes.size72,
                  image: AssetImage("assets/images/twitterLogo.png")),
              Gaps.v72,
              Gaps.v48,
              const Text(
                "See What's happening in the world right now.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v72,
              Gaps.v48,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: "Use email & password",
                isDark: false,
              ),
              Gaps.v16,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
                isDark: false,
              ),
              Gaps.v10,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center, // 위젯들을 가운데 정렬
                children: [
                  // 첫 번째 Divider
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      height: 3,
                      thickness: 1,
                      endIndent: 10, // 텍스트 전의 간격
                    ),
                  ),

                  // "or" 텍스트
                  Text("or",
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold)),

                  // 두 번째 Divider
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      height: 3,
                      thickness: 1,
                      indent: 10, // 텍스트 후의 간격
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                  text: "Create account",
                  isDark: true,
                ),
              ),
              Gaps.v10,
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms',
                          style: TextStyle(color: Color(0xFF4693D9))),
                      TextSpan(
                        text: ',      ',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Color(0xFF4693D9))),
                      TextSpan(text: ', and '),
                      TextSpan(
                          text: 'Cookie Use',
                          style: TextStyle(
                            color: Color(0xFF4693D9),
                          )),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
              Gaps.v20,
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    text: 'Have an account already? ',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          color: Color(0xFF4693D9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
