import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/InterestsScreen.dart';
import 'package:tiktok_challenge/ui/AuthButtonWithEnable.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  String _password = "";

  List<String> code = List.filled(6, '', growable: false);
  int currentIndex = 0;

  void _onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _toNextPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const InterestsScreen()));
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
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
                        onTap: () => _onBack(context),
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
                    Text(
                      "You'll need a password",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Gaps.v16,
                const Row(
                  children: [
                    Gaps.h20,
                    Text(
                      "Make sure it's 8 characters or more.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Gaps.v16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gaps.v16,
                      TextField(
                        controller: _passwordController,
                        onEditingComplete: _onSubmit,
                        obscureText: _obscureText,
                        autocorrect: false,
                        decoration: InputDecoration(
                          suffix: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _onClearTap,
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey.shade500,
                                  size: Sizes.size20,
                                ),
                              ),
                              Gaps.h16,
                              GestureDetector(
                                onTap: _toggleObscureText,
                                child: FaIcon(
                                  _obscureText
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey.shade500,
                                  size: Sizes.size20,
                                ),
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.circleCheck,
                                size: Sizes.size20,
                                color: _isPasswordValid()
                                    ? Colors.green
                                    : Colors.white,
                              ),
                            ],
                          ),
                          hintText: "Make it strong!",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Gaps.v10,
                const SizedBox(height: 20),
                Gaps.v60,
                const Row(
                  children: [
                    Gaps.h20,
                    Text(
                      "Didn't receive email?",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4693D9),
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
                GestureDetector(
                  onTap: () => _toNextPage(context),
                  child: AuthButtonWithEnable(
                    text: "Next",
                    icon: const FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                    isDark: true,
                    isEnable: !_isPasswordValid(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
