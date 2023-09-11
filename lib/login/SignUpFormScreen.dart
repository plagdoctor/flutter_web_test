import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/login/CustomizeTwitter.dart';
import 'package:tiktok_challenge/login/SignUpFinishScreen.dart';
import 'package:tiktok_challenge/ui/AuthButton.dart';
import 'package:tiktok_challenge/ui/FormButton.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({super.key});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildContentBasedOnProcess() {
    return Column(
      children: [
        const Text(
          "This will not shown publicly. Confirm your own age, even if this account is for a business, a pet, or somthing else.",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        Gaps.v28,
        GestureDetector(
          onTap: () => _onSubmit(context),
          child: FormButton(
            disabled:
                (!_isPasswordValid() || !_isEmailValid() || !_isBirthValid()),
          ),
        ),
      ],
    );
  }

  Widget _buildContentBasedOnProcess2() {
    return Column(
      children: [
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
          onTap: () => _toFinish(context),
          child: const AuthButton(
            icon: FaIcon(FontAwesomeIcons.solidArrowAltCircleUp),
            text: "Sign up",
            isDark: true,
          ),
        ),
      ],
    );
  }

  Map<String, String> formData = {};

  String _email = "";

  String _password = "";

  String _dateBirth = "";

  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _nameController.addListener(() {
      setState(() {
        _password = _nameController.text;
      });
    });
    _dateController.addListener(() {
      setState(() {
        _dateBirth = _dateController.text;
      });
    });

    // _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  bool _isBirthValid() {
    return _dateBirth.isNotEmpty;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isEmailValid() {
    if (_email.isEmpty) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return false;
    }
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit(BuildContext context) async {
    if (_email.isEmpty || !_isEmailValid()) return;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // print('Email: $_email');
      final retValue = await Navigator.of(context).push<bool>(
          MaterialPageRoute(builder: (context) => const CustomizeTwitter()));
      print('retValue: $retValue');

      setState(() {
        switchValue = retValue!;
      });
    }
  }

  void _onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _toFinish(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignUpFinishScreen()));
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v48,
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
                  "Create your account",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v36,
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['name'] = newValue;
                    }
                  },
                  controller: _nameController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size20,
                          color:
                              _isPasswordValid() ? Colors.green : Colors.white,
                        ),
                      ],
                    ),
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
                Gaps.v32,
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['email'] = newValue;
                    }
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onEditingComplete: () => _onSubmit(context),
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size20,
                          color: _isEmailValid() ? Colors.green : Colors.white,
                        ),
                      ],
                    ),
                    // hintText: "Email",
                    // errorText: _isEmailValid(),
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

                Gaps.v32,
                const Text(
                  "Birth of date",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['birthDate'] = newValue;
                    }
                  },
                  controller: _dateController,
                  readOnly: true, // 키보드가 나타나지 않도록 설정
                  onTap: () async {
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (date) {
                            setState(() {
                              selectedDate = date;
                              _dateController.text = "${selectedDate.toLocal()}"
                                  .split(' ')[0]; // 선택된 날짜로 텍스트 업데이트
                            });
                          },
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size20,
                          color: _isBirthValid() ? Colors.green : Colors.white,
                        ),
                      ],
                    ),
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
                ),
                // "or" 텍스트
                if (switchValue == true)
                  _buildContentBasedOnProcess2()
                else
                  _buildContentBasedOnProcess()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
