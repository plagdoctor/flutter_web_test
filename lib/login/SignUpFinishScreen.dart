import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/PassWordScreen.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';

class SignUpFinishScreen extends StatefulWidget {
  const SignUpFinishScreen({super.key});

  @override
  _SignUpFinishScreenState createState() => _SignUpFinishScreenState();
}

class _SignUpFinishScreenState extends State<SignUpFinishScreen> {
  final TextEditingController _controller = TextEditingController();

  List<String> code = List.filled(4, '', growable: false);
  int currentIndex = 0;

  void _onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _toNextPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  String _pin = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _pin = _controller.text;
      });
    });
  }

  bool _isPasswordValid() {
    return _pin.isNotEmpty && _pin.length == 4;
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
                      "We sent you a code",
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
                      "Enter it below to verify",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Gaps.h20,
                    Text(
                      "doctormiumiu@gmail.com",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 40,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: (currentIndex == index)
                                ? Colors.black
                                : Colors.black45,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          code[index],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.transparent),
                  cursorColor: Colors.transparent,
                  showCursor: false,
                  decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  maxLength: 6,
                  onChanged: (value) {
                    setState(() {
                      currentIndex = value.length;
                      for (int i = 0; i < 4; i++) {
                        if (i < value.length) {
                          code[i] = value[i];
                        } else {
                          code[i] = '';
                        }
                      }
                    });
                  },
                ),
                Center(
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.white,
                  ),
                ),
                // todo didn't receive email + next button
                // todo didn't receive email + next button
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
                  child: const AuthButton(
                      text: "Next",
                      icon: FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
                      isDark: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
